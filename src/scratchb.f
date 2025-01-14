      SUBROUTINE SCRATCH1(ISCR,FILE12)
C=======================================================================
C
C     Version 2019-1 (June 2019)
C
C     PURPOSE
C     =======
C     OPEN SCRATCH FILE EITHER WITH OR WITHOUT FILENAME.
C
C     ARGUMENTS
C     =========
C     ISCR     = I/O NUMBER NUMBER (INTEGER)
C     FILENAME = FILE NAME (CHRACTER*12)
C
C     VERSIONS
C     ========
C     THERE ARE 2 VERSIONS OF THIS ROUTINE,
C     scratcha.f = OPEN WITH FILENAME
C     scratchb.f = OPEN WITHOUT FILENAME
C
C     YOU NEED MERELY LOAD THE CODES WITH WHICHEVER IS BEST
C     FOR YOU - SEE BELOW FOR DETAILS
C
C     THERE IS ACTUALLY ONLY ONE VERSION WITH PART OF THE
C     CODE COMMENTED OUT, TO ONLY OPEN FILES EITHER WITH OR
C     WITHOUT FILE NAMES - SEE BELOW.
C
C     COMPILER DEPENDENCE
C     ===================
C     1) MOST COMPILERS ALLOW SCRATCH FILES TO BE OPENED
C        WITH OR WITHOUT NAMES = RECOMMENDED OPEN WITH
C     2) ON IBM-PC ABSOFT AND MICROSOFT DO NOT ALLOW NAMES
C     3) ON IBM-PC LAHEY REQUIRES NAMES (GETS CONFUSED IF
C        THERE ARE MULTIPLE SCRATCH FILES WITHOUT NAMES)
C
C     THE CONVENIENCE OF NAMES
C     ========================
C     1) MANY SYSTEMS WILL CREATE SCRATCH FILES WITH RANDOM
C        NAMES, AND NOT DELETE THEM WHEN EXECUTION ENDS
C     2) THIS CAN LEAD TO AN ACCUMULATION OF MANY UNUSED
C        SCRATCH FILES
C     3) WITH NAMES, SOME SYSTEMS WILL DELETE AND SOME WON'T
C        WHEN EXECUTION ENDS - IS YOU END UP WITH EITHER
C        NO SCRATCH FILES OR A FIXED NUMBER THAT DOESN'T
C        ACCUMULATE OVER MANY RUNS
C     4) THAT'S WHY USING NAMES IS RECOMMENDED
C
C     WARNING
C     =======
C     IN ORDER TO WORK PROPERLY THE FILENAME MUST BE
C     EXACTLY 12 CHARACTER LONG = MAXIMUM ALLOWED FOR
C     IBM-PC FILENAME COMPATIBILITY
C     MAXIMUM = 8 CHARACTER FILE NAME
C               1 CHARACTER .
C               3 CHARACTER EXTENSION
C
C     IF THE ACTUAL NAME IS LESS THAN 12 CHARACTERS BE SURE TO
C     PAD THE NAME OUT TO 12 CHARACTERS WHEN THIS ROUTINE IS
C     CALLED, E.G., IF THE NAME IS - EXAMPLE.X, USE,
C     'EXAMPLE.X   '
C      123456789012
C
C     NOTE - THE 3 TRAILING BLANKS TO PAD THE NAME TO 12 CHARACTERS.
C
C=======================================================================
      INCLUDE 'implicit.h'
      CHARACTER*12 FILE12
C-----USE FILENAME TO PREVENT COMPILER WARNING
      IF(FILE12.EQ.'            ') RETURN
c-----------------------------------------------------------------------
C
C     BELOW IS THE ONLY DIFFERENCE BETWEEN SCRATCHA AND SCRATCHB
C     SCRATCHA = OPEN WITH    FILENAME
C     SCRSTCHB = OPEN WITHOUT FILENAME
C
c-----------------------------------------------------------------------
C***** DEBUG
C-----SCRATCHA: OPEN FILE WITH    FILENAME
C     OPEN(ISCR,FILE=FILE12,FORM='UNFORMATTED',STATUS='SCRATCH')
C***** DEBUG
C-----SCRATCHB: OPEN FILE WITHOUT FILENAME
      OPEN(ISCR,            FORM='UNFORMATTED',STATUS='SCRATCH')
C***** DEBUG
      RETURN
      END
