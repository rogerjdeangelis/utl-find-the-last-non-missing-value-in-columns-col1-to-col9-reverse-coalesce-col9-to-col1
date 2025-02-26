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






















































                                run;quit;

























                                 .


       LAST_NON_
Obs     MISSING

 1         60









%let pgm=utl-create-csv-file-with-both-character-and-numeric-variables-double-quoted-example-of-tilde-format;

Create a csv file with both character and numeric variables double quoted example of tilde format;

      1 single datastep
        Author: Søren Lassen, s.lassen@post.tele.dk  (utl_varlist)
      2 two datasteps and proc transpose
        https://tinyurl.com/4upntr8r

The put and input statement are very flexible.

github
https://tinyurl.com/3dud38sf
https://github.com/rogerjdeangelis/utl-create-csv-file-with-both-character-and-numeric-variables-double-quoted-example-of-tilde-format

tom
https://tinyurl.com/4upntr8r
https://communities.sas.com/t5/user/viewprofilepage/user-id/159

sas communities
https://tinyurl.com/emyd78su
https://communities.sas.com/t5/SAS-Programming/Macro-to-export-sas-datset-to-CSV-with-all-columns-both-numeric/m-p/957309#M373717


/**************************************************************************************************************/
/*                           |                                          |                                     */
/*     INPUT                 |         PROCESS                          |      OUTPUT                         */
/*     =====                 |         =======                          |      ======                         */
/*                           |                                          |                                     */
/*   SASHELP.CLASS(          | 1 single datastep tilde modifier         | d:/csv/qcsvrog.csv                  */
/*     obs=5                 |                                          |                                     */
/*     keep=name sex age)    | data _null_;                             | 'NAME'n,'SEX'n,'AGE'n               */
/*                           |                                          | "Alfred","M","14"                   */
/*   NAME      SEX    AGE    |   file "d:/csv/qcsvrog.csv"              | "Alice","F","13"                    */
/*                           |     dsd                                  | "Barbara","F","13"                  */
/*  Alfred      M     14     |     lrecl=1000000;                       | "Carol","F","14"                    */
/*  Alice       F     13     |                                          | "Henry","M","14"                    */
/*  Barbara     F     13     |    put "%utl_varlist(sashelp.class       |                                     */
/*  Carol       F     14     |    ,keep=name sex age                    |    * check csv'                     */
/*  Henry       M     14     |    ,qstyle=sas                           |                                     */
/*                           |    ,od=%str(,))";                        | proc import out=want                */
/*                           |                                          |     datafile="d:/csv/qcsvrog.csv"   */
/*                           |    do until(dne);                        |     dbms=csv                        */
/*                           |       set sashelp.class(                 |     replace;                        */
/*                           |          obs=5                           |     getnames=yes;                   */
/*                           |          keep=name sex age) end=dne;     | run;quit;                           */
/*                           |       put (_all_) (~);                   |                                     */
/*                           |    end;                                  |                                     */
/*                           |                                          | work.want                           */
/*                           |  stop;                                   |                                     */
/*                           |                                          |  NAME      SEX    AGE               */
/*                           |  run;quit;                               |                                     */
/*                           |                                          |  Alfred      M     14               */
/*                           |                                          |  Alice       F     13               */
/*                           |                                          |  Barbara     F     13               */
/*                           |                                          |  Carol       F     14               */
/*                           |                                          |  Henry       M     14               */
/*                           |                                          |                                     */
/*                           |--------------------------------------------------------------------------------*/
/*                           |                                          |                                     */
/*                           |   2 two datasteps and proc transpose     |                                     */
/*                           |   ===================================    | "NAME","SEX","AGE"                  */
/*                           |                                          | "Alfred","M","14"                   */
/*                           |   proc transpose                         | "Alice","F","13"                    */
/*                           |     data=sashelp.class(obs=0)            | "Barbara","F","13"                  */
/*                           |     out=names;                           | "Carol","F","14"                    */
/*                           |     var _all_ ;                          | "Henry","M","14"                    */
/*                           |   run;quit;                              |                                     */
/*                           |                                          |                                     */
/*                           |   data _null_;                           |                                     */
/*                           |     file "d:/csv/qcsvtom.csv"            |                                     */
/*                           |         dsd                              |                                     */
/*                           |         lrecl=1000000;                   |                                     */
/*                           |     set names;                           |                                     */
/*                           |     put _name_ ~ @;                      |                                     */
/*                           |   run;                                   |                                     */
/*                           |                                          |                                     */
/*                           |   data _null_;                           |                                     */
/*                           |     file "d:/csv/qcsvtom.csv"            |                                     */
/*                           |         dsd                              |                                     */
/*                           |         mod                              |                                     */
/*                           |         lrecl=1000000;                   |                                     */
/*                           |     set sashelp.class(                   |                                     */
/*                           |          obs=5                           |                                     */
/*                           |          keep=name sex age);             |                                     */
/*                           |     put (_all_) (~);                     |                                     */
/*                           |   run;quit;                              |                                     */
/*                           |                                          |                                     */
/**************************************************************************************************************/

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
