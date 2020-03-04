/******************************************************************************
 *
 *  canon_abbrevs.h -	Canonical text information to be included by
 *			 VerseKey.cpp
 *
 * $Id: canon_abbrevs.h 2970 2013-08-22 07:03:11Z chrislit $
 *
 * Copyright 2009-2013 CrossWire Bible Society (http://www.crosswire.org)
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

#ifndef CANON_ABBREVS_H
#define CANON_ABBREVS_H

SWORD_NAMESPACE_START


/******************************************************************************
 *	Abbreviations - MUST be in alphabetical order & by PRIORITY
 *		RULE: first match of entire key
 *			(e.g. key: "1CH"; match: "1CHRONICLES")
 */

const struct abbrev builtin_abbrevs[] = {
	{"Shepherd's Rod Vol. 1", "Gen"}, // Shepherd's Rod Vol. 1
	{"Shepherd's Rod Vol. 2", "Exod"}, // Shepherd's Rod Vol. 2
	{"Tract No. 1", "Lev"}, // Tract No. 1
	{"Tract No. 2", "Num"}, // Tract No. 2
	{"Tract No. 3", "Deut"}, // Tract No. 3
	{"Tract No. 4", "Josh"}, // Tract No. 4
	{"Tract No. 5", "Judg"}, // Tract No. 5
	{"Tract No. 6", "Ruth"}, // Tract No. 6
	{"Tract No. 7", "1Sam"}, // Tract No. 7
	{"Tract No. 8", "2Sam"}, // Tract No. 8
	{"Tract No. 9", "1Kgs"}, // Tract No. 9
	{"Tract No. 10", "2Kgs"}, // Tract No. 10
	{"Tract No. 11", "1Chr"}, // Tract No. 11
	{"Tract No. 12", "2Chr"}, // Tract No. 12
	{"Tract No. 13", "1Esd"}, // Tract No. 13
	{"Tract No. 14", "Ezra"}, // Tract No. 14
	{"Tract No. 15", "Neh"}, // Tract No. 15
	{"1950 Gen Conf Special", "Esth"}, // 1950 Gen Conf Special
	{"White House Recruiter", "Jdt"}, // White House Recruiter
	{"SRod Vol. 1 Pocket Ed.", "Tob"}, // SRod Vol. 1 Pocket Ed.
	{"The Leviticus", "1Macc"}, // The Leviticus
	{"Fundamental Beliefs", "2Macc"}, // Fundamental Beliefs
	{"Entering Wedge", "3Macc"}, // Entering Wedge
	{"Military Stand", "4Macc"}, // Military Stand
	{"Mt. Carmel Training Center", "Ps"}, // Mt. Carmel Training Center
	{"Un-Adventist Activities", "PrMan"}, // Un-Adventist Activities
	{"1TG Nos. 1,2", "Prov"}, // 1TG Nos. 1,2
	{"1TG Nos. 3,4", "Eccl"}, // 1TG Nos. 3,4
	{"1TG Nos. 5,6", "Song"}, // 1TG Nos. 5,6
	{"1TG Nos. 7,8", "Job"}, // 1TG Nos. 7,8
	{"1TG Nos. 9,10", "Wis"}, // 1TG Nos. 9,10
	{"1TG Nos. 11,12", "Sir"}, // 1TG Nos. 11,12
	{"1TG Nos. 13,14", "PssSol"}, // 1TG Nos. 13,14
	{"1TG Nos. 15,16", "Hos"}, // 1TG Nos. 15,16
	{"1TG Nos. 17,18", "Amos"}, // 1TG Nos. 17,18
	{"1TG Nos. 19,20", "Mic"}, // 1TG Nos. 19,20
	{"1TG Nos. 21,22", "Joel"}, // 1TG Nos. 21,22
	{"1TG Nos. 23,24", "Obad"}, // 1TG Nos. 23,24
	{"1TG Nos. 25,26", "Jonah"}, // 1TG Nos. 25,26
	{"1TG Nos. 27,28", "Nah"}, // 1TG Nos. 27,28
	{"1TG Nos. 29,30", "Hab"}, // 1TG Nos. 29,30
	{"1TG Nos. 31, 32", "Zeph"}, // 1TG Nos. 31, 32
	{"1TG Nos. 33,34,35", "Hag"}, // 1TG Nos. 33,34,35
	{"1TG Nos. 36,37,38", "Zech"}, // 1TG Nos. 36,37,38
	{"1TG Nos. 39,40,41", "Mal"}, // 1TG Nos. 39,40,41
	{"1TG Nos. 42,43", "Isa"}, // 1TG Nos. 42,43
	{"1TG Nos. 44,45", "Jer"}, // 1TG Nos. 44,45
	{"1TG Nos. 46,47,48", "Bar"}, // 1TG Nos. 46,47,48
	{"1TG Nos. 49,50", "Lam"}, // 1TG Nos. 49,50
	{"1TG Nos. 51,52", "EpJer"}, // 1TG Nos. 51,52
	{"2TG Nos. 1,2", "Ezek"}, // 2TG Nos. 1,2
	{"2TG Nos. 3,4", "PrAzar"}, // 2TG Nos. 3,4
	{"2TG Nos. 5,6", "Sus"}, // 2TG Nos. 5,6
	{"2TG Nos. 7,8", "Dan"}, // 2TG Nos. 7,8
	{"2TG Nos. 9,10", "Bel"}, // 2TG Nos. 9,10
	{"2TG Nos. 11,12", "1En"}, // 2TG Nos. 11,12
	{"2TG Nos. 13,14", "Odes"}, // 2TG Nos. 13,14
	{"2TG Nos. 15,16", "Matt"}, // 2TG Nos. 15,16
	{"2TG Nos. 17,18", "Mark"}, // 2TG Nos. 17,18
	{"2TG Nos. 19,20", "Luke"}, // 2TG Nos. 19,20
	{"2TG Nos. 21,22", "John"}, // 2TG Nos. 21,22
	{"2TG Nos. 23,24", "Acts"}, // 2TG Nos. 23,24
	{"2TG Nos. 25,26", "Rom"}, // 2TG Nos. 25,26
	{"2TG Nos. 27,28", "1Cor"}, // 2TG Nos. 27,28
	{"2TG Nos. 29,30", "2Cor"}, // 2TG Nos. 29,30
	{"2TG Nos. 31,32", "Gal"}, // 2TG Nos. 31,32
	{"2TG Nos. 33,34", "Eph"}, // 2TG Nos. 33,34
	{"2TG No. 35", "Phil"}, // 2TG No. 35
	{"2TG Nos. 36,37", "Col"}, // 2TG Nos. 36,37
	{"2TG No. 38", "1Thess"}, // 2TG No. 38
	{"2TG Nos. 39,40", "2Thess"}, // 2TG Nos. 39,40
	{"2TG Nos. 41,42", "1Tim"}, // 2TG Nos. 41,42
	{"2TG Nos. 43,44", "2Tim"}, // 2TG Nos. 43,44
	{"2TG Nos. 45,46", "Titus"}, // 2TG Nos. 45,46
	{"Jezreel Letter 1", "Phlm"}, // Jezreel Letter 1
	{"Jezreel Letter 2", "Heb"}, // Jezreel Letter 2
	{"Jezreel Letter 3", "Jas"}, // Jezreel Letter 3
	{"Jezreel Letter 4", "1Pet"}, // Jezreel Letter 4
	{"Jezreel Letter 5", "2Pet"}, // Jezreel Letter 5
	{"Jezreel Letter 6", "1John"}, // Jezreel Letter 6
	{"Jezreel Letter 7", "2John"}, // Jezreel Letter 7
	{"Jezreel Letter 8", "3John"}, // Jezreel Letter 8
	{"Jezreel Letter 9", "Jude"}, // Jezreel Letter 9
	{"Cert. of Fellowship Letter", "Rev"}, // Cert. of Fellowship Letter
     {"", ""}
};


SWORD_NAMESPACE_END


#endif
