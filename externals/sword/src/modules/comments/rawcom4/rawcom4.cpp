/******************************************************************************
 *
 *  rawcom4.cpp -	code for class 'RawCom4'- a module that reads raw
 *			commentary files:
 *			ot and nt using indexs ??.bks ??.cps ??.vss
 *
 * $Id: rawcom4.cpp 2833 2013-06-29 06:40:28Z chrislit $
 *
 * Copyright 2007-2013 CrossWire Bible Society (http://www.crosswire.org)
 *	CrossWire Bible Society
 *	P. O. Box 2528
 *	Tempe, AZ  85280-2528
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation version 2.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 */

#include <ctype.h>
#include <stdio.h>
#include <fcntl.h>

#include <filemgr.h>
#include <rawverse4.h>
#include <rawcom4.h>
#include <versekey.h>

SWORD_NAMESPACE_START

 /******************************************************************************
 * RawCom4 Constructor - Initializes data for instance of RawCom4
 *
 * ENT:	iname - Internal name for module
 *	idesc - Name to display to user for module
 *	idisp	 - Display object to use for displaying
 */

RawCom4::RawCom4(const char *ipath, const char *iname, const char *idesc, SWDisplay *idisp, SWTextEncoding encoding, SWTextDirection dir, SWTextMarkup markup, const char *ilang, const char *versification)
		: RawVerse4(ipath),
            SWCom(iname, idesc, idisp, encoding, dir, markup, ilang, versification) {
}


/******************************************************************************
 * RawCom4 Destructor - Cleans up instance of RawCom4
 */

RawCom4::~RawCom4()
{
}


bool RawCom4::isWritable() const {
	return ((idxfp[0]->getFd() > 0) && ((idxfp[0]->mode & FileMgr::RDWR) == FileMgr::RDWR));
}
/******************************************************************************
 * RawCom4::getRawEntry()	- Returns the correct verse when char * cast
 *					is requested
 *
 * RET: string buffer with verse
 */

SWBuf &RawCom4::getRawEntryBuf() const {
	long  start = 0;
	unsigned long size = 0;
	VerseKey *key = &getVerseKey();

	findOffset(key->getTestament(), key->getTestamentIndex(), &start, &size);
	entrySize = size;        // support getEntrySize call

	entryBuf = "";
	readText(key->getTestament(), start, size, entryBuf);

	rawFilter(entryBuf, 0);	// hack, decipher
	rawFilter(entryBuf, key);

//	if (!isUnicode())
		prepText(entryBuf);

	return entryBuf;
}


/******************************************************************************
 * RawCom4::increment	- Increments module key a number of entries
 *
 * ENT:	steps	- Number of entries to jump forward
 *
 * RET: *this
 */

void RawCom4::increment(int steps) {
	long  start;
	unsigned long size;
	VerseKey *tmpkey = &getVerseKey();

	findOffset(tmpkey->getTestament(), tmpkey->getTestamentIndex(), &start, &size);

	SWKey lastgood = *tmpkey;
	while (steps) {
		long laststart = start;
		unsigned long lastsize = size;
		SWKey lasttry = *tmpkey;
		(steps > 0) ? ++(*key) : --(*key);
		tmpkey = &getVerseKey();

		if ((error = key->popError())) {
			*key = lastgood;
			break;
		}
		long index = tmpkey->getTestamentIndex();
		findOffset(tmpkey->getTestament(), index, &start, &size);
		if (
			(((laststart != start) || (lastsize != size))	// we're a different entry
//				&& (start > 0)
				&& (size))	// and we actually have a size
				||(!skipConsecutiveLinks)) {	// or we don't want to skip consecutive links
			steps += (steps < 0) ? 1 : -1;
			lastgood = *tmpkey;
		}
	}
	error = (error) ? KEYERR_OUTOFBOUNDS : 0;
}


void RawCom4::setEntry(const char *inbuf, long len) {
	VerseKey *key = &getVerseKey();
	doSetText(key->getTestament(), key->getTestamentIndex(), inbuf, len);
}


void RawCom4::linkEntry(const SWKey *inkey) {
	VerseKey *destkey = &getVerseKey();
	const VerseKey *srckey = &getVerseKey(inkey);
	doLinkEntry(destkey->getTestament(), destkey->getTestamentIndex(), srckey->getTestamentIndex());
}


/******************************************************************************
 * RawCom4::deleteEntry	- deletes this entry
 *
 * RET: *this
 */

void RawCom4::deleteEntry() {

	VerseKey *key = &getVerseKey();
	doSetText(key->getTestament(), key->getTestamentIndex(), "");
}

bool RawCom4::isLinked(const SWKey *k1, const SWKey *k2) const {
	long start1, start2;
	unsigned long size1, size2;
	VerseKey *vk1 = &getVerseKey(k1);
	VerseKey *vk2 = &getVerseKey(k2);
	if (vk1->getTestament() != vk2->getTestament()) return false;

	findOffset(vk1->getTestament(), vk1->getTestamentIndex(), &start1, &size1);
	findOffset(vk2->getTestament(), vk2->getTestamentIndex(), &start2, &size2);
	if (!size1 || !size2) return false;
	return start1 == start2;
}

bool RawCom4::hasEntry(const SWKey *k) const {
	long start;
	unsigned long size;
	VerseKey *vk = &getVerseKey(k);

	findOffset(vk->getTestament(), vk->getTestamentIndex(), &start, &size);
	return size;
}

SWORD_NAMESPACE_END
