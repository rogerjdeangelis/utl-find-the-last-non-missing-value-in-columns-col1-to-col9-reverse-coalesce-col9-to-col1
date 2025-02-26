%let pgm=utl-find-the-last-non-missing-value-in-columns-col1-to-col9-reverse-coalesce-col9-to-col1;

%stop_submission;

I did not know that.
A querstion is worth a thousand answers.
Park this in the back of your brain.

Find the last non missing value in columns col1 to col9 reverse coalesce col9 to col1

  TWO SOLUTIONS

        1 coalesce(of c9-c1)
          Tom
          https://communities.sas.com/t5/user/viewprofilepage/user-id/159

        2 coalesce(of c9-c5,of c3-c1)  c4 is missing


github
https://tinyurl.com/mr387wan
https://github.com/rogerjdeangelis/utl-find-the-last-non-missing-value-in-columns-col1-to-col9-reverse-coalesce-col9-to-col1

sas communities
https://tinyurl.com/mun8rcxb
https://communities.sas.com/t5/SAS-Programming/How-do-I-select-the-last-valid-column-from-a-data-set/m-p/956997#M373615



/**************************************************************************************************************************/
/*                                  |                                                   |                                 */
/*         INPUT                    | PROCESS                                           |   OUTPUT                        */
/*         =====                    | =======                                           |   ======                        */
/*                                  |                                                   |                                 */
/* 1 SAS COLALESCE(OF C9-C1)        |                                                   |                                 */
/* =========================        |                                                   |                                 */
/*                                  |                                                   |                                 */
/* WORK.HAVE                        | data want;                                        |  LAST_NON_                      */
/*                                  |                                                   |   MISSING                       */
/* C1 C2 C3 C4 C5 C6 C7 C8 C9       |  set have;                                        |                                 */
/*                                  |  last_non_missing=coalesce(of c9-c1);             |      60                         */
/* 10 20 30 40 50 60  .  .  .       |  keep last_non_missing;                           |                                 */
/*                                  |                                                   |                                 */
/* data have;                       |  run;quit;                                        |                                 */
/*   array cols[89] c1-c9           |                                                   |                                 */
/*    (10 20 30 40 50 60 . . .);    |                                                   |                                 */
/* run;quit;                        |                                                   |                                 */
/*                                  |                                                   |                                 */
/*------------------------------------------------------------------------------------------------------------------------*/
/*                                  |                                                   |                                 */
/* 2 COALESCE(OF C9-C5,OF C3-C1)    |                                                   |  LAST_NON_                      */
/* =============================    |                                                   |   MISSING                       */
/*                                  |                                                   |                                 */
/* data have;                       | data want;                                        |      60                         */
/*   array cols[8] c1-c3 c5-c9      |                                                   |                                 */
/*    (10 20 30 50 60 . . .);       |  set have;                                        |                                 */
/* run;quit;                        |  last_non_missing=coalesce(of c9-c5, of c3-c1);   |                                 */
/*                                  |  keep last_non_missing;                           |                                 */
/*                                  |                                                   |                                 */
/*                                  | run;quit;                                         |                                 */
/*                                  |                                                   |                                 */
/**************************************************************************************************************************/

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/


