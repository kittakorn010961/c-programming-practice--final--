# C Programming — 25 Practice Problems for Quiz 5 & Final (Lecture 9–14)

A practice set built around the second half of the syllabus: functions, prototypes and pass-by-value (Lec 9), function and variable scope (Lec 10), pointers and pass-by-reference (Lec 11), pointers with arrays (Lec 12), strings (Lec 13), and structures (Lec 14). Hard problems also mix in loops, 1D/2D arrays and selection from the first half.

These are original practice problems, not official exam questions. No solution code is included. Like the lab exercises, many problems say **You MUST** use a specific function prototype or technique — treat that rule as part of the grading.

## How to use this set

- Write a separate C program for each problem. Use standard input and output; do not print prompts or extra labels.
- Whitespace separates input tokens unless a problem says to read a whole line (then use `fgets` and remove the trailing `\n`).
- When a problem gives a function prototype, use exactly that name, return type and parameter list, and do the work inside that function.
- Use `double` for real numbers and print them with `printf("%.2f", value)` unless stated otherwise.
- Every problem has a task, an input/output contract, constraints, at least two samples, and edge cases to test. Full test files are in [`testcases/`](testcases) — see *Self-check* below.
- Suggested times are practice targets. Trace a small case by hand, implement, then test the boundary cases.

## Difficulty overview

| Level | Problems | Focus |
|---|---|---|
| Easy (5) | E01–E05 | One concept each: prototype/definition/call, swap via pointers, string loop, one struct, global scope |
| Medium (10) | M01–M10 | Output parameters, pointer arithmetic, string library, array of structs, struct pointers |
| Hard (10) | H01–H10 | Several topics combined: parsing, sorting structs, validation, simulation, big numbers |

## Syllabus coverage (which lecture each problem practises)

| Lecture | Topic | Problems |
|---|---|---|
| Lec 9 | Functions: define, prototype, parameters, pass by value | E01, H02, H05, H07, H10 |
| Lec 10 | Function scope, variable scope, global variables | E05 (plus local variables in every problem) |
| Lec 11 | Pointers & addresses, pass by reference | E02, M01, M02, M08 |
| Lec 12 | Pointers with arrays, pointer arithmetic | M02, M04, M06, M09, M10, H04, H06 |
| Lec 13 | Strings: init, I/O, library functions, looping through strings | E03, M03, M04, M05, M09, H01, H03, H04, H06, H08, H09 |
| Lec 14 | Structures: declare, access, initialise, copy, array of structs, struct in functions | E04, M07, M08, H01, H02, H03, H05, H08, H09, H10 |

## Study plan

- Session 1 — warm-up: E01–E05 (about 50 minutes total).
- Session 2 — pointers & arrays: M01, M02, M06, M10, then M08 (struct pointer).
- Session 3 — strings & structs: M03, M04, M05, M07, M09.
- Session 4 — integrated: H01–H05. Session 5: H06–H10.
- If time is short before Quiz 5, prioritise E02, E05, M01, M06, M08, M09, H02, H04, H05.
- Mock quiz A (90 minutes): E05 (15 points), M06 (25), M08 (25), H05 (35).
- Mock quiz B (90 minutes): E02 (15 points), M09 (25), M07 (25), H04 (35).
- Suggested marking per problem: 50% correct algorithm, 20% follows the required prototype/technique, 20% boundary cases, 10% exact I/O.

## Self-check

Each problem folder in `testcases/` has numbered `.in` / `.out` files (samples first, then hidden edge cases). Compile your program and run:

```bash
./run_tests.sh E01 e01.c
```

The script compiles the file, runs every case and reports PASS/FAIL (trailing whitespace is ignored). All 60 sample outputs and 78 extra cases (138 total) were produced and checked with reference solutions.

## Easy

<details>
<summary>E01. Lab Thermometer Converter</summary>

**Syllabus:** Lec 9 | **Topics:** Function prototype • definition • call

**Difficulty:** Easy | **Suggested time:** 10 minutes

### Task

A science lab records temperatures in Celsius, but the report must be in Fahrenheit. Convert each reading with F = C × 9 / 5 + 32, print it, then print the average of all Fahrenheit values.

You **MUST** declare the prototype `double celsiusToFahrenheit(double c);` above `main()`, define the function **below** `main()`, and call it for every reading.

### Input and constraints

Line 1: n. Line 2: n real numbers (Celsius). 1 ≤ n ≤ 100; -273.15 ≤ C ≤ 1000.

### Output

n lines, each a Fahrenheit value with 2 decimal places. Last line: `AVG` followed by the average Fahrenheit value with 2 decimal places.

### Sample 1

Input:

```text
3
0 100 -40
```

Output:

```text
32.00
212.00
-40.00
AVG 68.00
```

### Sample 2

Input:

```text
1
36.6
```

Output:

```text
97.88
AVG 97.88
```

### Additional cases to test

Test -273.15 (absolute zero) and -40 (where both scales are equal). Use 9.0/5.0, not 9/5. (2 extra cases in `testcases/E01/`.)

</details>

<details>
<summary>E02. Three Lockers, One Swap Function</summary>

**Syllabus:** Lec 11 | **Topics:** Pointers • pass by reference

**Difficulty:** Easy | **Suggested time:** 10 minutes

### Task

Three lockers hold the numbers a, b, c. Sort them in ascending order using **only** this sequence of steps:

1. if a > b, swap a and b
2. if b > c, swap b and c
3. if a > b, swap a and b

Count how many swaps actually happened.

You **MUST** write `void swap(int *x, int *y);` and use it for every swap. Swapping inside `main()` without the function gets zero.

### Input and constraints

Three integers a b c, each in the range -10^6 to 10^6.

### Output

Line 1: the three numbers in ascending order. Line 2: the number of swaps performed.

### Sample 1

Input:

```text
7 2 5
```

Output:

```text
2 5 7
2
```

### Sample 2

Input:

```text
1 2 3
```

Output:

```text
1 2 3
0
```

### Sample 3

Input:

```text
9 9 1
```

Output:

```text
1 9 9
2
```

### Additional cases to test

Test already-sorted input (0 swaps), reverse order (3 swaps), and equal values (equal values are never swapped). (3 extra cases in `testcases/E02/`.)

</details>

<details>
<summary>E03. Vowel Counter for a Username</summary>

**Syllabus:** Lec 13 | **Topics:** String • loop through string • function

**Difficulty:** Easy | **Suggested time:** 10 minutes

### Task

Count the vowels (a, e, i, o, u, case-insensitive) and consonants (all other English letters) in one username. Digits, `_`, `-`, and other symbols are neither vowels nor consonants.

You **MUST** write `int countVowels(const char s[]);` and loop until the `'\0'` character (do not pass the length).

### Input and constraints

One word without spaces, at most 100 characters.

### Output

`vowels=V consonants=K`

### Sample 1

Input:

```text
Programming
```

Output:

```text
vowels=3 consonants=8
```

### Sample 2

Input:

```text
AEIOUaeiou
```

Output:

```text
vowels=10 consonants=0
```

### Additional cases to test

Test a word with no vowels (`Rhythm`), all vowels, and a word that mixes digits and symbols. `y` is a consonant. (3 extra cases in `testcases/E03/`.)

</details>

<details>
<summary>E04. Student Grade Card</summary>

**Syllabus:** Lec 14 | **Topics:** Structure declaration • pass struct to function

**Difficulty:** Easy | **Suggested time:** 10 minutes

### Task

Store one student in

```c
struct Student {
    char id[11];
    char name[31];
    double score;
};
```

and write `char getGrade(struct Student s);` that returns A (≥ 80), B (≥ 70), C (≥ 60), D (≥ 50), otherwise F. If the score is below 0 or above 100, print INVALID instead of a grade.

### Input and constraints

`id name score` on one line. The name has no spaces.

### Output

`id name grade` or `id name INVALID`.

### Sample 1

Input:

```text
6988001 Somchai 79.99
```

Output:

```text
6988001 Somchai B
```

### Sample 2

Input:

```text
6988002 Nida 80
```

Output:

```text
6988002 Nida A
```

### Sample 3

Input:

```text
6988003 Korn 120
```

Output:

```text
6988003 Korn INVALID
```

### Additional cases to test

Test the exact boundaries 80, 70, 60, 50, plus 79.99, 49.5, 0, and -1. (4 extra cases in `testcases/E04/`.)

</details>

<details>
<summary>E05. Queue Ticket Dispenser</summary>

**Syllabus:** Lec 10 | **Topics:** Global variable • variable scope

**Difficulty:** Easy | **Suggested time:** 10 minutes

### Task

A bank's ticket machine keeps its counter in a **global variable** `int nextTicket = 1;`.

- `int issueTicket(void)` returns the current number, then increases the counter. After 999 the counter goes back to 1.
- `void resetTickets(void)` sets the counter back to 1.

Process n commands: `T` issues a ticket, `R` resets the counter, and any other character is unknown.

You **MUST** use the global variable and both functions. `main()` must not change `nextTicket` directly.

### Input and constraints

Line 1: n (1 ≤ n ≤ 2000). Next n lines: one character each.

### Output

For `T`: `Ticket NNN`, with three digits and leading zeros. For `R`: `Reset`. Otherwise: `Unknown`.

### Sample 1

Input:

```text
5
T
T
R
T
T
```

Output:

```text
Ticket 001
Ticket 002
Reset
Ticket 001
Ticket 002
```

### Sample 2

Input:

```text
3
T
X
T
```

Output:

```text
Ticket 001
Unknown
Ticket 002
```

### Additional cases to test

Test `R` before any `T`, and more than 999 tickets (the number wraps back to 001). (2 extra cases in `testcases/E05/`.)

</details>

## Medium

<details>
<summary>M01. Sensor Statistics Through Pointers</summary>

**Syllabus:** Lec 11–12 | **Topics:** Pass by reference • arrays to functions

**Difficulty:** Medium | **Suggested time:** 15 minutes

### Task

A sensor sends n integer readings. One function must return **four** results to `main()` through pointers:

```c
void arrayStats(const int a[], int n, int *minVal, int *maxVal,
                double *avg, int *aboveAvg);
```

`aboveAvg` counts readings that are **strictly greater** than the average. The function must not print anything; `main()` prints the results.

### Input and constraints

Line 1: n (1 ≤ n ≤ 1000). Line 2: n integers between -10^6 and 10^6.

### Output

Line 1: `min max`. Line 2: average with 2 decimal places. Line 3: the aboveAvg count.

### Sample 1

Input:

```text
6
4 8 15 16 23 42
```

Output:

```text
4 42
18.00
2
```

### Sample 2

Input:

```text
3
5 5 5
```

Output:

```text
5 5
5.00
0
```

### Additional cases to test

Test n = 1, all values equal (aboveAvg = 0), and negative values. Use a `long long` sum. (3 extra cases in `testcases/M01/`.)

</details>

<details>
<summary>M02. Vending Machine Change</summary>

**Syllabus:** Lec 11–12 | **Topics:** Pointer to array • pointer arithmetic

**Difficulty:** Medium | **Suggested time:** 15 minutes

### Task

Thai banknotes and coins come in 1000, 500, 100, 50, 20, 10, 5, 2, and 1 baht. Give change using the largest denominations first (greedy).

You **MUST** write `void makeChange(int change, int *counts);`. It fills a 9-element array in the order above and writes through the pointer, for example `*(counts + i) = ...`.

### Input and constraints

Two integers: price and paid, with 0 ≤ price, paid ≤ 100000.

### Output

If paid < price: `INSUFFICIENT x`, where x is the missing amount. If paid = price: `NO CHANGE`. Otherwise: `CHANGE x`, then one `denomination x count` line for each denomination whose count is not zero (largest first), then `PIECES total`.

### Sample 1

Input:

```text
37 100
```

Output:

```text
CHANGE 63
50 x 1
10 x 1
2 x 1
1 x 1
PIECES 4
```

### Sample 2

Input:

```text
120 100
```

Output:

```text
INSUFFICIENT 20
```

### Sample 3

Input:

```text
500 500
```

Output:

```text
NO CHANGE
```

### Additional cases to test

Test change of 1, 1999, and 1888 (which uses every denomination). (3 extra cases in `testcases/M02/`.)

</details>

<details>
<summary>M03. Password Strength Checker</summary>

**Syllabus:** Lec 13 | **Topics:** String • character tests • array output parameter

**Difficulty:** Medium | **Suggested time:** 20 minutes

### Task

Check a password against 5 rules, in this order:

1. `length`: at least 8 characters
2. `upper`: contains an uppercase letter
3. `lower`: contains a lowercase letter
4. `digit`: contains a digit
5. `special`: contains any character that is not a letter or digit

The score is the number of rules passed. 5 is STRONG, 3–4 is MEDIUM, and 0–2 is WEAK.

You **MUST** write `int passwordScore(const char pw[], int missing[]);`. It returns the score and sets `missing[i] = 1` for each rule that failed.

### Input and constraints

One password, without spaces, of at most 50 characters.

### Output

Line 1: `SCORE s/5`. Line 2: the level. If s < 5, line 3: `Missing:` followed by the names of the failed rules, in the order above, separated by spaces.

### Sample 1

Input:

```text
Hello123
```

Output:

```text
SCORE 4/5
MEDIUM
Missing: special
```

### Sample 2

Input:

```text
P@ssw0rd!
```

Output:

```text
SCORE 5/5
STRONG
```

### Sample 3

Input:

```text
abc
```

Output:

```text
SCORE 1/5
WEAK
Missing: length upper digit special
```

### Additional cases to test

`________` passes only `length` and `special`. Test exactly 7 and exactly 8 characters. (4 extra cases in `testcases/M03/`.)

</details>

<details>
<summary>M04. Two-Pointer Palindrome Sign</summary>

**Syllabus:** Lec 12–13 | **Topics:** String input with spaces • pointers on strings

**Difficulty:** Medium | **Suggested time:** 20 minutes

### Task

A shop sign is a palindrome if it reads the same forwards and backwards after **removing every non-alphanumeric character** and **ignoring case**.

First build a cleaned lowercase string. Then check it with `int isPalindrome(const char *s);`, which **MUST** use two pointers (`left` and `right`) moving towards each other. Do not use `s[i]` inside this function.

### Input and constraints

One line of up to 200 characters, which may contain spaces. Read it with `fgets`.

### Output

If the cleaned string is empty: `EMPTY`. Otherwise, line 1 is the cleaned string and line 2 is `YES` or `NO`.

### Sample 1

Input:

```text
A man, a plan, a canal: Panama!
```

Output:

```text
amanaplanacanalpanama
YES
```

### Sample 2

Input:

```text
Mahidol ICT
```

Output:

```text
mahidolict
NO
```

### Sample 3

Input:

```text
?!? ...
```

Output:

```text
EMPTY
```

### Additional cases to test

Test a single character, `ab`, mixed digits and letters (`1a2 2A1`), and a line containing only punctuation. (4 extra cases in `testcases/M04/`.)

</details>

<details>
<summary>M05. Reverse the Announcement</summary>

**Syllabus:** Lec 13 | **Topics:** String library functions • fgets • strtok/strcpy

**Difficulty:** Medium | **Suggested time:** 20 minutes

### Task

Reverse the order of the words in a sentence. Words are separated by one or more spaces. Print them separated by exactly one space, with no leading or trailing spaces. The characters inside each word stay the same.

Store each word in a 2D char array, for example `char words[100][201]`, and use `string.h` functions.

### Input and constraints

One line of up to 200 characters.

### Output

Line 1: the words in reverse order (an empty line if there are no words). Line 2: `words=N`.

### Sample 1

Input:

```text
I love C programming
```

Output:

```text
programming C love I
words=4
```

### Sample 2

Input:

```text
   many    spaces   here  
```

Output:

```text
here spaces many
words=3
```

### Additional cases to test

Test a single word, many extra spaces, and a line that contains only spaces. Remember that `fgets` keeps the `\n` at the end. (3 extra cases in `testcases/M05/`.)

</details>

<details>
<summary>M06. Rotating Conveyor Belt</summary>

**Syllabus:** Lec 12 | **Topics:** Pointers with arrays • pointer arithmetic

**Difficulty:** Medium | **Suggested time:** 25 minutes

### Task

Rotate an array right by k positions. A negative k rotates left. k can be very large, so reduce it with `% n` first.

You **MUST** write `void rotate(int *a, int n, int k);` that rotates **in place** using pointer arithmetic only. `a[i]` indexing inside `rotate` (and any helper functions) gets zero. Hint: three reversals with two pointers.

### Input and constraints

Line 1: n k, with 1 ≤ n ≤ 1000 and |k| ≤ 10^18 (read k as `long long`). Line 2: n integers.

### Output

The rotated array, separated by spaces.

### Sample 1

Input:

```text
5 2
1 2 3 4 5
```

Output:

```text
4 5 1 2 3
```

### Sample 2

Input:

```text
5 -1
1 2 3 4 5
```

Output:

```text
2 3 4 5 1
```

### Sample 3

Input:

```text
4 1000000002
10 20 30 40
```

Output:

```text
30 40 10 20
```

### Additional cases to test

Test k = n, k as a multiple of n, negative k with |k| > n, and n = 1. (3 extra cases in `testcases/M06/`.)

</details>

<details>
<summary>M07. Library Desk</summary>

**Syllabus:** Lec 14 | **Topics:** Array of structures • strcmp search

**Difficulty:** Medium | **Suggested time:** 25 minutes

### Task

Use `struct Book { int id; char title[41]; int year; int copies; };` and process queries:

- `FIND title` prints `id year copies` or `NOT FOUND`
- `BORROW id`: if copies > 0, decrease it and print `OK title left=c`. Otherwise print `UNAVAILABLE title`.
- `RETURN id` increases copies and prints `RETURNED title left=c`

For `BORROW` or `RETURN` with an unknown id, print `NO SUCH BOOK`.

You **MUST** write `int findById(struct Book b[], int n, int id);` and `int findByTitle(struct Book b[], int n, const char t[]);`. Each returns the index, or -1 if not found.

### Input and constraints

n (1 ≤ n ≤ 100), then n lines `id title year copies` (titles use `_` instead of spaces). Then q (1 ≤ q ≤ 1000), then q queries.

### Output

One line per query.

### Sample 1

Input:

```text
3
101 Clean_Code 2008 1
102 The_C_Programming_Language 1988 2
103 Algorithms 2011 0
5
FIND Algorithms
BORROW 101
BORROW 101
RETURN 101
FIND Python
```

Output:

```text
103 2011 0
OK Clean_Code left=0
UNAVAILABLE Clean_Code
RETURNED Clean_Code left=1
NOT FOUND
```

### Sample 2

Input:

```text
1
7 Dune 1965 1
3
BORROW 8
BORROW 7
FIND Dune
```

Output:

```text
NO SUCH BOOK
OK Dune left=0
7 1965 0
```

### Additional cases to test

Borrow the same book until it runs out, return it, then borrow again. Titles are case-sensitive. (2 extra cases in `testcases/M07/`.)

</details>

<details>
<summary>M08. Bank Account with Struct Pointers</summary>

**Syllabus:** Lec 11 + 14 | **Topics:** Pointer to structure • -> operator

**Difficulty:** Medium | **Suggested time:** 25 minutes

### Task

Use `struct Account { char owner[31]; double balance; };`. Each withdrawal charges a fee of **5.00 baht**, so a withdrawal succeeds only if amount + 5 ≤ balance.

You **MUST** write

```c
int deposit(struct Account *acc, double amt);
int withdraw(struct Account *acc, double amt);
```

Each function returns 1 on success and 0 on failure, and updates the balance through `acc->balance`.

Commands:

- `D x`: deposit x
- `W x`: withdraw x
- `B`: print the balance

An amount ≤ 0 is invalid.

### Input and constraints

Line 1: `owner balance n`. Then n commands.

### Output

`D`: `Deposit OK: bal`. `W`: `Withdraw OK: bal` or `Withdraw FAILED`. `B`: `owner: bal`. Invalid amount: `INVALID AMOUNT`. Finally print `Success s Failed f`, where `B` commands count as neither. All money values have 2 decimal places.

### Sample 1

Input:

```text
Korn 1000 5
D 500
W 200
B
W 2000
D -50
```

Output:

```text
Deposit OK: 1500.00
Withdraw OK: 1295.00
Korn: 1295.00
Withdraw FAILED
INVALID AMOUNT
Success 2 Failed 2
```

### Sample 2

Input:

```text
Nida 10 3
W 5
W 1
B
```

Output:

```text
Withdraw OK: 0.00
Withdraw FAILED
Nida: 0.00
Success 1 Failed 1
```

### Additional cases to test

Withdraw exactly balance - 5 (succeeds and leaves 0.00). Test a starting balance of 0 and a deposit of 0. (2 extra cases in `testcases/M08/`.)

</details>

<details>
<summary>M09. Caesar Cipher Messenger</summary>

**Syllabus:** Lec 12–13 | **Topics:** Modify string through pointer • character arithmetic

**Difficulty:** Medium | **Suggested time:** 20 minutes

### Task

Encrypt (`E`) or decrypt (`D`) a message with a Caesar shift k. Letters keep their case and wrap around, so `z` + 1 = `a`. All other characters stay unchanged. Decrypting with k is the same as encrypting with -k.

You **MUST** write `void shiftText(char *s, int k);` that changes the string **in place** by walking a pointer until `'\0'`.

### Input and constraints

Line 1: mode and k (|k| ≤ 10^18). Line 2: a message of up to 200 characters, which may contain spaces.

### Output

The resulting message.

### Sample 1

Input:

```text
E 3
Hello, World!
```

Output:

```text
Khoor, Zruog!
```

### Sample 2

Input:

```text
D 3
Khoor, Zruog!
```

Output:

```text
Hello, World!
```

### Sample 3

Input:

```text
E -1
abc XYZ
```

Output:

```text
zab WXY
```

### Additional cases to test

Test k = 26 (no change), negative k, a huge k, and digits or punctuation (unchanged). In C, `-1 % 26` is `-1`, so fix negative remainders. (3 extra cases in `testcases/M09/`.)

</details>

<details>
<summary>M10. Merge Two Sorted Queues</summary>

**Syllabus:** Lec 12 | **Topics:** Pointers with arrays • returning a count

**Difficulty:** Medium | **Suggested time:** 20 minutes

### Task

Two queues are already sorted in non-decreasing order. Merge them into one sorted array and count how many distinct values the result has.

You **MUST** write `int mergeArrays(const int *a, int n, const int *b, int m, int *out);`. It moves pointers through `a`, `b`, and `out` (no `[ ]` indexing inside) and returns the merged length.

### Input and constraints

n, then n sorted integers; m, then m sorted integers. 0 ≤ n, m ≤ 500. An empty array is given as a blank line.

### Output

Line 1: the merged array (an empty line if both arrays are empty). Line 2: `unique=U`.

### Sample 1

Input:

```text
4
1 3 5 7
3
2 3 8
```

Output:

```text
1 2 3 3 5 7 8
unique=6
```

### Sample 2

Input:

```text
1
5
0
```

Output:

```text
5
unique=1
```

### Additional cases to test

Test duplicate values in both arrays, one empty array, and both arrays empty. (3 extra cases in `testcases/M10/`.)

</details>

## Hard

<details>
<summary>H01. Word Frequency Report</summary>

**Syllabus:** Lec 13–14 | **Topics:** Read until EOF • array of structs • sorting with strcmp

**Difficulty:** Hard | **Suggested time:** 35 minutes

### Task

Read text until EOF. A **word** is a maximal run of English letters, converted to lowercase. Every other character is a separator, so `hello-world` is 2 words. Count each word using

```c
struct WordCount { char word[31]; int count; };
```

Sort by count (descending), then alphabetically (ascending), and print at most the top K.

### Input and constraints

Line 1: K (1 ≤ K ≤ 500). The rest: any text, with at most 500 distinct words, each at most 30 letters.

### Output

Up to K lines `word count`. Then print `distinct=D total=T`.

### Sample 1

Input:

```text
3
The cat and the hat. The CAT sat!
```

Output:

```text
the 3
cat 2
and 1
distinct=5 total=8
```

### Sample 2

Input:

```text
5
C is fun; C is fast. Is C hard? No!
```

Output:

```text
c 3
is 3
fast 1
fun 1
hard 1
distinct=6 total=10
```

### Additional cases to test

Test empty text, K larger than the number of distinct words, and ties that need alphabetical order. Read with `getchar()` or `fgets` in a loop. (3 extra cases in `testcases/H01/`.)

</details>

<details>
<summary>H02. Class Ranking with Ties</summary>

**Syllabus:** Lec 9 + 14 | **Topics:** Array of structs • sorting • functions returning struct data

**Difficulty:** Hard | **Suggested time:** 35 minutes

### Task

Each student has a midterm, final, and project score. Compute total = 0.3·mid + 0.4·final + 0.3·project with

```c
struct Student { char id[9]; char name[31]; double mid, fin, proj, total; };
double computeTotal(struct Student s);
```

Sort by total (descending), breaking ties by id (ascending). Totals within 1e-9 of each other count as equal. Use **competition ranking**: equal totals share a rank, and the next rank skips ahead (1, 2, 2, 4). The grade uses the same scale as E04.

### Input and constraints

n (1 ≤ n ≤ 100), then n lines `id name mid final project`.

### Output

n lines `rank id name total grade`, with the total to 2 decimal places. Last line: `Class average: x.xx`.

### Sample 1

Input:

```text
4
66000001 Ann 80 90 70
66000002 Ben 70 70 70
66000003 Cat 90 80 70
66000004 Dan 100 50 90
```

Output:

```text
1 66000001 Ann 81.00 A
2 66000003 Cat 80.00 A
3 66000004 Dan 77.00 B
4 66000002 Ben 70.00 B
Class average: 77.00
```

### Sample 2

Input:

```text
3
66000009 Zed 50 50 50
66000005 Amy 50 50 50
66000007 Max 40 60 50
```

Output:

```text
1 66000007 Max 51.00 D
2 66000005 Amy 50.00 D
2 66000009 Zed 50.00 D
Class average: 50.33
```

### Additional cases to test

Test students tied on total (79.99/80/80.01 gives 80.00) and a single student. Swap whole structs while sorting. (2 extra cases in `testcases/H02/`.)

</details>

<details>
<summary>H03. Mini-Mart Inventory Console</summary>

**Syllabus:** Lec 13–14 | **Topics:** Array of structs • command parsing • strcmp

**Difficulty:** Hard | **Suggested time:** 40 minutes

### Task

Use `struct Item { char code[11]; char name[31]; int qty; double price; };` and `int findItem(struct Item it[], int n, const char *code);`. Process commands until `END`:

- `ADD code name qty price` prints `ADDED code`, or `DUPLICATE code` if the code already exists
- `SELL code q` prints `SOLD q name amount` and adds the amount to revenue. If stock is too low, print `OUT OF STOCK code (have x)`. If the code is unknown, print `UNKNOWN code`.
- `RESTOCK code q` prints `RESTOCKED code qty=new`, or `UNKNOWN code`
- `REPORT` prints every item sorted by code (strcmp order) as `code name qty price`, then `Stock value: v`

After `END`, print `Revenue: r`. All money values have 2 decimal places. `REPORT` must **not** change the stored order of the items (sort a copy).

### Input and constraints

Commands, one per line, ending with `END`. At most 100 items.

### Output

As described above.

### Sample 1

Input:

```text
ADD A100 Pen 10 12.5
ADD B200 Notebook 5 45
SELL A100 3
SELL B200 9
RESTOCK B200 10
SELL C300 1
ADD A100 Pencil 1 5
REPORT
END
```

Output:

```text
ADDED A100
ADDED B200
SOLD 3 Pen 37.50
OUT OF STOCK B200 (have 5)
RESTOCKED B200 qty=15
UNKNOWN C300
DUPLICATE A100
A100 Pen 7 12.50
B200 Notebook 15 45.00
Stock value: 762.50
Revenue: 37.50
```

### Sample 2

Input:

```text
ADD Z1 Tea 2 20
REPORT
SELL Z1 2
REPORT
END
```

Output:

```text
ADDED Z1
Z1 Tea 2 20.00
Stock value: 40.00
SOLD 2 Tea 40.00
Z1 Tea 0 20.00
Stock value: 0.00
Revenue: 40.00
```

### Additional cases to test

Test `REPORT` with no items, selling 0 units, and restocking an unknown code. (2 extra cases in `testcases/H03/`.)

</details>

<details>
<summary>H04. Run-Length Encoder / Decoder</summary>

**Syllabus:** Lec 12–13 | **Topics:** Strings • pointers • validation

**Difficulty:** Hard | **Suggested time:** 40 minutes

### Task

Mode `C` compresses a string of letters: each run is written as the letter, followed by the run length only if it is greater than 1 (`aaabcc` → `a3bc2`). Also print saved = original length − compressed length.

Mode `D` decodes. The input is **INVALID** if:

- it starts with a digit
- a count has a leading zero
- a count is less than 2
- the decoded length would exceed 1000

You **MUST** write `void compress(const char *s, char *out);` and `int decompress(const char *s, char *out);`. `decompress` returns 0 when the input is invalid.

### Input and constraints

One line: mode and a string (without spaces) of up to 200 characters.

### Output

`C`: line 1 is the compressed string and line 2 is `saved=x` (x may be 0). `D`: line 1 is the decoded string and line 2 is `length=L`, or only `INVALID`.

### Sample 1

Input:

```text
C aaabccddddd
```

Output:

```text
a3bc2d5
saved=4
```

### Sample 2

Input:

```text
D a3bc2d5
```

Output:

```text
aaabccddddd
length=11
```

### Sample 3

Input:

```text
D a1b
```

Output:

```text
INVALID
```

### Additional cases to test

Test multi-digit counts (`x12y`), `a1b`, `a01`, `3a`, exactly 1000 output characters (valid), and 1001 (invalid). (7 extra cases in `testcases/H04/`.)

</details>

<details>
<summary>H05. Days Between Two Dates</summary>

**Syllabus:** Lec 9 + 14 | **Topics:** Structs • several cooperating functions

**Difficulty:** Hard | **Suggested time:** 40 minutes

### Task

Use `struct Date { int d, m, y; };` and write

```c
int isLeap(int y);
int isValidDate(struct Date d);
long toDayNumber(struct Date d);   // days since 01/01/1900
```

Print the signed number of days from date 1 to date 2, and the weekday of each date. **01/01/1900 is a Monday.** A year is a leap year if it is divisible by 400, or divisible by 4 but not by 100.

### Input and constraints

Two dates `dd/mm/yyyy dd/mm/yyyy`, with years from 1900 to 2100.

### Output

If either date is invalid: `INVALID`. Otherwise line 1 is `days=X` (negative if date 2 is earlier), and lines 2–3 are the weekday names (`Monday` … `Sunday`).

### Sample 1

Input:

```text
01/01/2000 01/03/2000
```

Output:

```text
days=60
Saturday
Wednesday
```

### Sample 2

Input:

```text
18/11/2026 01/01/2026
```

Output:

```text
days=-321
Wednesday
Thursday
```

### Sample 3

Input:

```text
29/02/2023 01/03/2023
```

Output:

```text
INVALID
```

### Additional cases to test

Test 29/02 in a leap year and a non-leap year, 31/04, the same date twice, and the full 1900–2100 range (2000 is a leap year, 1900 and 2100 are not). (4 extra cases in `testcases/H05/`.)

</details>

<details>
<summary>H06. Big Number Calculator</summary>

**Syllabus:** Lec 12–13 | **Topics:** Strings as digit arrays • functions • pointers

**Difficulty:** Hard | **Suggested time:** 45 minutes

### Task

Two non-negative integers can each have up to 100 digits, which is too large for `long long`. Print a + b and a − b. The input may contain leading zeros. The output must have **no** leading zeros, except for the number `0` itself.

You **MUST** write

```c
int  compareBig(const char *a, const char *b);   // returns 1, 0, or -1
void addBig(const char *a, const char *b, char *result);
void subBig(const char *a, const char *b, char *result);   // assumes a >= b
```

and use `compareBig` to decide whether a − b is negative.

### Input and constraints

Two digit strings, each with 1 to 100 digits.

### Output

Line 1: the sum. Line 2: the difference, with a leading `-` when it is negative.

### Sample 1

Input:

```text
123 989
```

Output:

```text
1112
-866
```

### Sample 2

Input:

```text
1000 999
```

Output:

```text
1999
1
```

### Sample 3

Input:

```text
5 12
```

Output:

```text
17
-7
```

### Additional cases to test

Test `0000 0`, carries that make the result longer (`999…9 + 1`), equal numbers with different leading zeros, and a 30-digit minus 1. (4 extra cases in `testcases/H06/`.)

</details>

<details>
<summary>H07. Spiral Warehouse Robot</summary>

**Syllabus:** Lec 7 + 9 | **Topics:** 2D array parameters • boundary loops

**Difficulty:** Hard | **Suggested time:** 35 minutes

### Task

A robot reads shelf IDs in a clockwise spiral, starting from the top-left corner. Store the spiral order in a 1D array.

You **MUST** write `int spiralOrder(int m[][20], int r, int c, int *out);`, which returns the number of values written. Also print the number of rings (layers), which is ⌈min(r, c) / 2⌉.

### Input and constraints

r c (1 ≤ r, c ≤ 20), then the grid of integers.

### Output

Line 1: the spiral sequence. Line 2: `layers=L`.

### Sample 1

Input:

```text
3 3
1 2 3
4 5 6
7 8 9
```

Output:

```text
1 2 3 6 9 8 7 4 5
layers=2
```

### Sample 2

Input:

```text
3 4
1 2 3 4
5 6 7 8
9 10 11 12
```

Output:

```text
1 2 3 4 8 12 11 10 9 5 6 7
layers=2
```

### Additional cases to test

Test a single row, a single column, 1×1, and non-square grids. Check that no cell is visited twice in a middle row or column. (4 extra cases in `testcases/H07/`.)

</details>

<details>
<summary>H08. Condo Parking Gate</summary>

**Syllabus:** Lec 13–14 | **Topics:** Array of structs • strings • fee function

**Difficulty:** Hard | **Suggested time:** 45 minutes

### Task

Use `struct Car { char plate[11]; int inMin; int active; };`. Process events until `END`:

- `IN plate hh:mm` prints `WELCOME plate`. If the car is already inside, print `ALREADY IN plate`.
- `OUT plate hh:mm` prints `plate d min fee F`. If the car is not inside, print `NOT FOUND plate`. If the time is earlier than the entry time, print `ERROR TIME plate` (the car stays inside).

Fee rules (same day), written as `int computeFee(int minutes);`:

- 15 minutes or less is free
- otherwise 20 baht for each started hour
- the fee is capped at 200

A car may enter again after it leaves.

### Input and constraints

Events, one per line, ending with `END`. At most 200 entries.

### Output

One line per event. Then `Parked:` followed by the plates still inside in strcmp order, or `none`. Then `Total fee: x`.

### Sample 1

Input:

```text
IN ABC123 08:00
IN XY99 08:10
OUT ABC123 08:15
OUT XY99 10:11
IN ABC123 12:00
END
```

Output:

```text
WELCOME ABC123
WELCOME XY99
ABC123 15 min fee 0
XY99 121 min fee 60
WELCOME ABC123
Parked: ABC123
Total fee: 60
```

### Sample 2

Input:

```text
IN K1 09:00
IN K1 09:30
OUT K2 10:00
OUT K1 23:59
END
```

Output:

```text
WELCOME K1
ALREADY IN K1
NOT FOUND K2
K1 899 min fee 200
Parked: none
Total fee: 200
```

### Additional cases to test

Test exactly 15 minutes (free) and 16 minutes (20 baht), the 200 cap, re-entry, and an OUT that comes before its IN time. (2 extra cases in `testcases/H08/`.)

</details>

<details>
<summary>H09. Email Validator and Domain Report</summary>

**Syllabus:** Lec 13–14 | **Topics:** String parsing • strchr • struct counting

**Difficulty:** Hard | **Suggested time:** 45 minutes

### Task

Convert each email to lowercase, then validate it:

- exactly one `@`
- **local part**: 1–30 characters from `a-z 0-9 . _`. It must not start or end with `.`, and must not contain `..`.
- **domain**: at least 2 labels separated by `.`. Each label has 1–63 characters from `a-z 0-9 -` and does not start or end with `-`. The last label has only letters and at least 2 characters.

Count valid emails per domain and sort the domains by count (descending), then by name (ascending).

You **MUST** write `int isValidEmail(char *email, char *domain);`. It returns 1 or 0 and copies the domain out when the email is valid.

### Input and constraints

n (1 ≤ n ≤ 100), then n emails without spaces, each at most 60 characters.

### Output

n lines `VALID` or `INVALID`. Then `Domains:`, followed by `domain count` lines, or `none`.

### Sample 1

Input:

```text
5
korn@student.mahidol.ac.th
Nida.S@Gmail.com
bad@@mail.com
.dot@mail.com
ann@gmail.com
```

Output:

```text
VALID
VALID
INVALID
INVALID
VALID
Domains:
gmail.com 2
student.mahidol.ac.th 1
```

### Sample 2

Input:

```text
3
a@b.c
x..y@site.org
ok_1@my-site.io
```

Output:

```text
INVALID
INVALID
VALID
Domains:
my-site.io 1
```

### Additional cases to test

Test `a@b.c` (TLD too short), `x..y@site.org`, `user@-bad.com`, `u@x..yz`, uppercase letters in the domain, and a digit in the TLD. (3 extra cases in `testcases/H09/`.)

</details>

<details>
<summary>H10. Ranked-Choice Club Election</summary>

**Syllabus:** Lec 7 + 14 | **Topics:** Array of structs • 2D array • multi-round simulation

**Difficulty:** Hard | **Suggested time:** 50 minutes

### Task

Each ballot ranks all c candidates. In every round, each ballot counts for its highest-ranked candidate who has **not** been eliminated.

- Print the round's counts for the active candidates, in input order.
- If a candidate has **more than half** of all ballots, they win.
- Otherwise, if every active candidate has the same count, the result is a tie.
- Otherwise, eliminate the active candidate with the fewest votes. If several are tied for fewest, eliminate the one that appears **latest** in the input.

Use `struct Candidate { char name[21]; int votes; int active; };` and write `void countVotes(struct Candidate c[], int nc, int ballots[][10], int nb);`.

### Input and constraints

c (2 ≤ c ≤ 10), then c names. b (1 ≤ b ≤ 100), then b lines, each a permutation of 1..c (1 = first candidate listed).

### Output

For each round: `Round r: name=votes ...`. Then either `Eliminated: name`, `Winner: name`, or `Tie: names...`.

### Sample 1

Input:

```text
3
Alice Bob Carol
5
1 2 3
1 3 2
2 1 3
2 3 1
3 2 1
```

Output:

```text
Round 1: Alice=2 Bob=2 Carol=1
Eliminated: Carol
Round 2: Alice=2 Bob=3
Winner: Bob
```

### Sample 2

Input:

```text
2
X Y
4
1 2
2 1
1 2
2 1
```

Output:

```text
Round 1: X=2 Y=2
Tie: X Y
```

### Additional cases to test

Test a first-round winner, a tie between all remaining candidates, and a tie for last place (the later candidate in the input is eliminated). (3 extra cases in `testcases/H10/`.)

</details>
