-- ============================================================
-- CodeJamm - 100+ Programs Complete SQL File
-- Pehle schema.sql run karo, phir yeh file run karo
-- mysql -u root -p codejamm_db < codejamm-100-programs.sql
-- ============================================================

USE codejamm_db;

-- Pehle existing programs clear karo (fresh start)
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE programs;
TRUNCATE TABLE topics;
SET FOREIGN_KEY_CHECKS = 1;

-- ============================================================
-- TOPICS INSERT
-- ============================================================
INSERT INTO topics (id, name, description, category_id, difficulty_level, display_order) VALUES
-- Easy Programs (cat 1)
(1,  'Basic Syntax',          'Hello World, Variables, Input/Output',         1, 'EASY',     1),
(2,  'Control Flow',          'If-else, Switch, Loops',                        1, 'EASY',     2),
(3,  'Basic Math',            'Arithmetic, Number problems',                   1, 'EASY',     3),
-- Moderate Programs (cat 2)
(4,  'Sorting Algorithms',    'Bubble, Selection, Insertion, Merge, Quick',    2, 'MODERATE', 1),
(5,  'Searching Algorithms',  'Linear Search, Binary Search',                  2, 'MODERATE', 2),
(6,  'Recursion',             'Recursive problem solving',                     2, 'MODERATE', 3),
-- Advanced Programs (cat 3)
(7,  'Dynamic Programming',   'Memoization and Tabulation',                    3, 'ADVANCED', 1),
(8,  'Graph Algorithms',      'BFS, DFS, Dijkstra',                            3, 'ADVANCED', 2),
(9,  'Backtracking',          'N-Queens, Permutations, Subsets',               3, 'ADVANCED', 3),
-- Data Structures (cat 4)
(10, 'Arrays',                'Array operations and algorithms',               4, 'MODERATE', 1),
(11, 'Linked Lists',          'Singly, Doubly, Circular',                      4, 'MODERATE', 2),
(12, 'Stacks',                'Stack implementation and applications',         4, 'MODERATE', 3),
(13, 'Queues',                'Queue, Deque, Priority Queue',                  4, 'MODERATE', 4),
(14, 'Trees',                 'Binary Trees, BST, AVL, Heap',                  4, 'ADVANCED', 5),
-- OOPs (cat 5)
(15, 'Classes and Objects',   'Basics of OOP',                                 5, 'MODERATE', 1),
(16, 'Inheritance',           'Extending classes',                             5, 'MODERATE', 2),
(17, 'Polymorphism',          'Method overloading and overriding',             5, 'MODERATE', 3),
(18, 'Abstraction',           'Abstract classes and interfaces',               5, 'ADVANCED', 4),
(19, 'Encapsulation',         'Access modifiers and getters/setters',          5, 'MODERATE', 5),
-- Pattern Printing (cat 6)
(20, 'Star Patterns',         'Triangle, Diamond, Pyramid patterns',           6, 'EASY',     1),
(21, 'Number Patterns',       'Pascal, Floyd, Number triangles',               6, 'EASY',     2),
-- Matrix (cat 7)
(22, 'Matrix Operations',     'Addition, Multiplication, Transpose',           7, 'MODERATE', 1),
(23, 'Matrix Algorithms',     'Rotation, Spiral, Diagonal',                    7, 'MODERATE', 2),
-- String (cat 8)
(24, 'String Basics',         'Reverse, Palindrome, Anagram',                  8, 'EASY',     1),
(25, 'String Algorithms',     'Pattern matching, Subsequence',                 8, 'MODERATE', 2),
-- Collections (cat 9)
(26, 'ArrayList & LinkedList','List operations in Java',                       9, 'MODERATE', 1),
(27, 'HashMap & HashSet',     'Map and Set operations',                        9, 'MODERATE', 2),
(28, 'Stack & Queue',         'Using Java Stack and Queue classes',            9, 'MODERATE', 3),
-- JDBC (cat 10)
(29, 'JDBC Basics',           'Connection, Statement, ResultSet',              10, 'MODERATE', 1),
(30, 'JDBC CRUD',             'Create, Read, Update, Delete operations',       10, 'ADVANCED', 2);


-- ============================================================
-- ✅ EASY PROGRAMS (35 programs)
-- ============================================================

INSERT INTO programs (title, description, code, explanation, sample_output, topic_id, difficulty_level, time_complexity, space_complexity, display_order) VALUES

-- ── Basic Syntax (topic 1) ──────────────────────────────────

('Hello World',
'Classic first Java program',
'public class HelloWorld {\n    public static void main(String[] args) {\n        System.out.println("Hello, World!");\n    }\n}',
'Sabse pehla Java program. System.out.println() console pe output print karta hai. Har Java program mein ek main method hona zaroori hai.',
'Hello, World!', 1, 'EASY', 'O(1)', 'O(1)', 1),

('Print Your Name',
'Apna naam print karo',
'public class PrintName {\n    public static void main(String[] args) {\n        String name = "Ayush";\n        System.out.println("My name is: " + name);\n    }\n}',
'String variable mein naam store karke print karo. + operator se string concatenation hoti hai.',
'My name is: Ayush', 1, 'EASY', 'O(1)', 'O(1)', 2),

('Variables and Data Types',
'Java ke different data types explore karo',
'public class DataTypes {\n    public static void main(String[] args) {\n        int age = 20;\n        double salary = 50000.50;\n        char grade = \'A\';\n        boolean isStudent = true;\n        String name = "CodeJamm";\n        System.out.println("Name: " + name);\n        System.out.println("Age: " + age);\n        System.out.println("Salary: " + salary);\n        System.out.println("Grade: " + grade);\n        System.out.println("Is Student: " + isStudent);\n    }\n}',
'Java mein 5 main data types hain: int (integer), double (decimal), char (character), boolean (true/false), String (text).',
'Name: CodeJamm\nAge: 20\nSalary: 50000.5\nGrade: A\nIs Student: true', 1, 'EASY', 'O(1)', 'O(1)', 3),

('User Input with Scanner',
'User se input lo aur print karo',
'import java.util.Scanner;\npublic class UserInput {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        System.out.print("Enter your name: ");\n        String name = sc.nextLine();\n        System.out.print("Enter your age: ");\n        int age = sc.nextInt();\n        System.out.println("Hello " + name + "! You are " + age + " years old.");\n        sc.close();\n    }\n}',
'Scanner class java.util package mein hoti hai. nextLine() string ke liye, nextInt() integer ke liye use hota hai.',
'Hello Ayush! You are 20 years old.', 1, 'EASY', 'O(1)', 'O(1)', 4),

('Swap Two Numbers',
'Do numbers ko swap karo',
'public class SwapNumbers {\n    public static void main(String[] args) {\n        int a = 10, b = 20;\n        System.out.println("Before: a=" + a + ", b=" + b);\n        int temp = a;\n        a = b;\n        b = temp;\n        System.out.println("After: a=" + a + ", b=" + b);\n    }\n}',
'Swap ke liye ek temporary variable use karte hain. a ki value temp mein rakh lo, a mein b daalo, b mein temp daalo.',
'Before: a=10, b=20\nAfter: a=20, b=10', 1, 'EASY', 'O(1)', 'O(1)', 5),

-- ── Control Flow (topic 2) ──────────────────────────────────

('Even or Odd',
'Number even hai ya odd check karo',
'public class EvenOdd {\n    public static void main(String[] args) {\n        int num = 7;\n        if (num % 2 == 0) {\n            System.out.println(num + " is Even");\n        } else {\n            System.out.println(num + " is Odd");\n        }\n    }\n}',
'Modulo operator (%) remainder deta hai. Agar num % 2 == 0 toh even, warna odd.',
'7 is Odd', 2, 'EASY', 'O(1)', 'O(1)', 1),

('Largest of Three Numbers',
'Teen numbers mein sabse bada nikalo',
'public class LargestThree {\n    public static void main(String[] args) {\n        int a = 15, b = 42, c = 27;\n        int largest;\n        if (a >= b && a >= c) {\n            largest = a;\n        } else if (b >= a && b >= c) {\n            largest = b;\n        } else {\n            largest = c;\n        }\n        System.out.println("Largest: " + largest);\n    }\n}',
'Nested if-else conditions use karo. a ko b aur c dono se compare karo, phir b ko compare karo.',
'Largest: 42', 2, 'EASY', 'O(1)', 'O(1)', 2),

('Grade Calculator',
'Marks se grade calculate karo',
'public class GradeCalc {\n    public static void main(String[] args) {\n        int marks = 78;\n        char grade;\n        if (marks >= 90)      grade = \'A\';\n        else if (marks >= 80) grade = \'B\';\n        else if (marks >= 70) grade = \'C\';\n        else if (marks >= 60) grade = \'D\';\n        else                  grade = \'F\';\n        System.out.println("Marks: " + marks + " -> Grade: " + grade);\n    }\n}',
'If-else ladder use karo marks ke ranges ke liye. Sabse pehle highest range check karo.',
'Marks: 78 -> Grade: C', 2, 'EASY', 'O(1)', 'O(1)', 3),

('Multiplication Table',
'Kisi bhi number ki multiplication table print karo',
'public class MultiTable {\n    public static void main(String[] args) {\n        int n = 5;\n        System.out.println("Multiplication Table of " + n + ":");\n        for (int i = 1; i <= 10; i++) {\n            System.out.println(n + " x " + i + " = " + (n * i));\n        }\n    }\n}',
'For loop 1 se 10 tak chalao aur har baar n se multiply karo.',
'5 x 1 = 5\n5 x 2 = 10\n...\n5 x 10 = 50', 2, 'EASY', 'O(1)', 'O(1)', 4),

('Sum of Natural Numbers',
'1 se N tak ke numbers ka sum nikalo',
'public class SumNatural {\n    public static void main(String[] args) {\n        int n = 100;\n        int sum = 0;\n        for (int i = 1; i <= n; i++) {\n            sum += i;\n        }\n        System.out.println("Sum of 1 to " + n + " = " + sum);\n    }\n}',
'Loop se 1 se n tak iterate karo aur sum mein add karo. Formula: n*(n+1)/2 bhi use kar sakte ho.',
'Sum of 1 to 100 = 5050', 2, 'EASY', 'O(n)', 'O(1)', 5),

('Simple Calculator',
'Switch case se calculator banao',
'import java.util.Scanner;\npublic class Calculator {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        System.out.print("Enter num1: "); double a = sc.nextDouble();\n        System.out.print("Enter operator (+,-,*,/): "); char op = sc.next().charAt(0);\n        System.out.print("Enter num2: "); double b = sc.nextDouble();\n        switch (op) {\n            case \'+\': System.out.println("Result: " + (a + b)); break;\n            case \'-\': System.out.println("Result: " + (a - b)); break;\n            case \'*\': System.out.println("Result: " + (a * b)); break;\n            case \'/\':\n                if (b != 0) System.out.println("Result: " + (a / b));\n                else System.out.println("Error: Division by zero!");\n                break;\n            default: System.out.println("Invalid operator!");\n        }\n        sc.close();\n    }\n}',
'Switch-case operator ke basis pe operation choose karta hai. Division mein zero check karna zaroori hai.',
'Result: 15.0', 2, 'EASY', 'O(1)', 'O(1)', 6),

('Leap Year Check',
'Saal leap year hai ya nahi check karo',
'public class LeapYear {\n    public static void main(String[] args) {\n        int year = 2024;\n        boolean isLeap = (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);\n        if (isLeap)\n            System.out.println(year + " is a Leap Year");\n        else\n            System.out.println(year + " is NOT a Leap Year");\n    }\n}',
'Leap year condition: (4 se divisible AND 100 se nahi) OR (400 se divisible).',
'2024 is a Leap Year', 2, 'EASY', 'O(1)', 'O(1)', 7),

-- ── Basic Math (topic 3) ──────────────────────────────────

('Factorial of a Number',
'Recursion se factorial calculate karo',
'public class Factorial {\n    static int factorial(int n) {\n        if (n == 0 || n == 1) return 1;\n        return n * factorial(n - 1);\n    }\n    public static void main(String[] args) {\n        int num = 6;\n        System.out.println("Factorial of " + num + " = " + factorial(num));\n    }\n}',
'Factorial n! = n × (n-1) × ... × 1. Base case: 0! = 1! = 1. Recursion se solve karte hain.',
'Factorial of 6 = 720', 3, 'EASY', 'O(n)', 'O(n)', 1),

('Fibonacci Series',
'Fibonacci sequence generate karo',
'public class Fibonacci {\n    public static void main(String[] args) {\n        int n = 10;\n        int a = 0, b = 1;\n        System.out.print("Fibonacci: ");\n        for (int i = 0; i < n; i++) {\n            System.out.print(a + " ");\n            int next = a + b;\n            a = b;\n            b = next;\n        }\n    }\n}',
'Fibonacci mein har number pichle do numbers ka sum hota hai. 0, 1, 1, 2, 3, 5, 8...',
'Fibonacci: 0 1 1 2 3 5 8 13 21 34', 3, 'EASY', 'O(n)', 'O(1)', 2),

('Prime Number Check',
'Number prime hai ya nahi check karo',
'public class PrimeCheck {\n    static boolean isPrime(int n) {\n        if (n < 2) return false;\n        for (int i = 2; i <= Math.sqrt(n); i++) {\n            if (n % i == 0) return false;\n        }\n        return true;\n    }\n    public static void main(String[] args) {\n        int num = 17;\n        if (isPrime(num))\n            System.out.println(num + " is Prime");\n        else\n            System.out.println(num + " is Not Prime");\n    }\n}',
'Prime number sirf 1 aur khud se divisible hota hai. sqrt(n) tak check karna efficient hai.',
'17 is Prime', 3, 'EASY', 'O(√n)', 'O(1)', 3),

('Sum of Digits',
'Number ke digits ka sum nikalo',
'public class SumDigits {\n    public static void main(String[] args) {\n        int num = 12345;\n        int sum = 0;\n        int temp = num;\n        while (temp != 0) {\n            sum += temp % 10;\n            temp /= 10;\n        }\n        System.out.println("Sum of digits of " + num + " = " + sum);\n    }\n}',
'% 10 se last digit nikalo, /= 10 se last digit hatao. Repeat karo jab tak number 0 na ho jaye.',
'Sum of digits of 12345 = 15', 3, 'EASY', 'O(d)', 'O(1)', 4),

('Reverse a Number',
'Number ko reverse karo',
'public class ReverseNum {\n    public static void main(String[] args) {\n        int num = 12345;\n        int rev = 0;\n        while (num != 0) {\n            rev = rev * 10 + num % 10;\n            num /= 10;\n        }\n        System.out.println("Reversed: " + rev);\n    }\n}',
'Last digit nikalo (% 10), rev mein add karo (rev*10+digit), aur number se last digit hatao (/= 10).',
'Reversed: 54321', 3, 'EASY', 'O(d)', 'O(1)', 5),

('Armstrong Number',
'Armstrong number check karo',
'public class Armstrong {\n    public static void main(String[] args) {\n        int num = 153;\n        int sum = 0, temp = num, digits = String.valueOf(num).length();\n        while (temp != 0) {\n            int d = temp % 10;\n            sum += (int) Math.pow(d, digits);\n            temp /= 10;\n        }\n        if (sum == num)\n            System.out.println(num + " is an Armstrong Number");\n        else\n            System.out.println(num + " is NOT an Armstrong Number");\n    }\n}',
'Armstrong number: har digit ko uske number of digits ki power se raise karo. 153 = 1^3 + 5^3 + 3^3 = 153.',
'153 is an Armstrong Number', 3, 'EASY', 'O(d)', 'O(1)', 6),

('GCD and LCM',
'Do numbers ka GCD aur LCM nikalo',
'public class GcdLcm {\n    static int gcd(int a, int b) {\n        while (b != 0) {\n            int t = b; b = a % b; a = t;\n        }\n        return a;\n    }\n    public static void main(String[] args) {\n        int a = 36, b = 48;\n        int g = gcd(a, b);\n        int l = (a * b) / g;\n        System.out.println("GCD of " + a + " and " + b + " = " + g);\n        System.out.println("LCM of " + a + " and " + b + " = " + l);\n    }\n}',
'Euclidean algorithm se GCD nikalo. LCM = (a × b) / GCD.',
'GCD of 36 and 48 = 12\nLCM of 36 and 48 = 144', 3, 'EASY', 'O(log n)', 'O(1)', 7),

('Power of a Number',
'Base ka exponent power nikalo',
'public class Power {\n    static long power(int base, int exp) {\n        long result = 1;\n        for (int i = 0; i < exp; i++) result *= base;\n        return result;\n    }\n    public static void main(String[] args) {\n        System.out.println("2^10 = " + power(2, 10));\n        System.out.println("3^5  = " + power(3, 5));\n    }\n}',
'Loop se base ko exp baar multiply karo. Ya Math.pow() bhi use kar sakte hain.',
'2^10 = 1024\n3^5  = 243', 3, 'EASY', 'O(exp)', 'O(1)', 8),

-- ── Star Patterns (topic 20) ──────────────────────────────────

('Right Triangle Star Pattern',
'Right angled triangle banao',
'public class RightTriangle {\n    public static void main(String[] args) {\n        int n = 5;\n        for (int i = 1; i <= n; i++) {\n            for (int j = 1; j <= i; j++) {\n                System.out.print("* ");\n            }\n            System.out.println();\n        }\n    }\n}',
'Outer loop rows ke liye, inner loop columns ke liye. Row i mein i stars print hote hain.',
'*\n* *\n* * *\n* * * *\n* * * * *', 20, 'EASY', 'O(n²)', 'O(1)', 1),

('Inverted Triangle Star',
'Ulta triangle banao',
'public class InvertedTriangle {\n    public static void main(String[] args) {\n        int n = 5;\n        for (int i = n; i >= 1; i--) {\n            for (int j = 1; j <= i; j++) {\n                System.out.print("* ");\n            }\n            System.out.println();\n        }\n    }\n}',
'Outer loop n se 1 tak ghata hai. Row i mein i stars hote hain.',
'* * * * *\n* * * *\n* * *\n* *\n*', 20, 'EASY', 'O(n²)', 'O(1)', 2),

('Pyramid Star Pattern',
'Pyramid banao',
'public class Pyramid {\n    public static void main(String[] args) {\n        int n = 5;\n        for (int i = 1; i <= n; i++) {\n            for (int j = i; j < n; j++) System.out.print(" ");\n            for (int j = 1; j <= (2*i-1); j++) System.out.print("*");\n            System.out.println();\n        }\n    }\n}',
'Pyramid ke liye spaces aur stars dono manage karo. Row i mein (n-i) spaces aur (2i-1) stars hote hain.',
'    *\n   ***\n  *****\n *******\n*********', 20, 'EASY', 'O(n²)', 'O(1)', 3),

('Diamond Pattern',
'Diamond shape banao',
'public class Diamond {\n    public static void main(String[] args) {\n        int n = 5;\n        for (int i = 1; i <= n; i++) {\n            for (int j = i; j < n; j++) System.out.print(" ");\n            for (int j = 1; j <= (2*i-1); j++) System.out.print("*");\n            System.out.println();\n        }\n        for (int i = n-1; i >= 1; i--) {\n            for (int j = n; j > i; j--) System.out.print(" ");\n            for (int j = 1; j <= (2*i-1); j++) System.out.print("*");\n            System.out.println();\n        }\n    }\n}',
'Diamond = Upar wala pyramid + Neeche wala inverted pyramid.',
'  *\n ***\n*****\n ***\n  *', 20, 'EASY', 'O(n²)', 'O(1)', 4),

-- ── Number Patterns (topic 21) ──────────────────────────────────

('Pascal Triangle',
'Pascal triangle print karo',
'public class PascalTriangle {\n    public static void main(String[] args) {\n        int n = 6;\n        for (int i = 0; i < n; i++) {\n            int num = 1;\n            for (int j = 0; j <= i; j++) {\n                System.out.print(num + " ");\n                num = num * (i - j) / (j + 1);\n            }\n            System.out.println();\n        }\n    }\n}',
'Pascal triangle mein har element uske upar ke do elements ka sum hota hai. Combination formula use karo.',
'1\n1 1\n1 2 1\n1 3 3 1\n1 4 6 4 1', 21, 'EASY', 'O(n²)', 'O(1)', 1),

('Floyd Triangle',
'Floyd triangle print karo',
'public class FloydTriangle {\n    public static void main(String[] args) {\n        int n = 5, count = 1;\n        for (int i = 1; i <= n; i++) {\n            for (int j = 1; j <= i; j++) {\n                System.out.print(count + " ");\n                count++;\n            }\n            System.out.println();\n        }\n    }\n}',
'Floyd triangle mein consecutive numbers hote hain. Ek counter variable rakhte hain jo continuously badhta hai.',
'1\n2 3\n4 5 6\n7 8 9 10', 21, 'EASY', 'O(n²)', 'O(1)', 2),

-- ── String Basics (topic 24) ──────────────────────────────────

('Reverse a String',
'String ko reverse karo',
'public class ReverseString {\n    public static void main(String[] args) {\n        String str = "CodeJamm";\n        String rev = new StringBuilder(str).reverse().toString();\n        System.out.println("Original: " + str);\n        System.out.println("Reversed: " + rev);\n    }\n}',
'StringBuilder ka reverse() method directly string reverse karta hai. Ya loop se bhi kar sakte hain.',
'Original: CodeJamm\nReversed: mmamJedoC', 24, 'EASY', 'O(n)', 'O(n)', 1),

('Palindrome Check',
'String palindrome hai ya nahi check karo',
'public class Palindrome {\n    public static void main(String[] args) {\n        String str = "madam";\n        String rev = new StringBuilder(str).reverse().toString();\n        if (str.equals(rev))\n            System.out.println(str + " is a Palindrome");\n        else\n            System.out.println(str + " is NOT a Palindrome");\n    }\n}',
'Palindrome wo string hai jo ulta padhne pe bhi same hoti hai. Reverse karo aur compare karo.',
'madam is a Palindrome', 24, 'EASY', 'O(n)', 'O(n)', 2),

('Count Vowels and Consonants',
'String mein vowels aur consonants count karo',
'public class VowelCount {\n    public static void main(String[] args) {\n        String str = "Hello World";\n        int vowels = 0, consonants = 0;\n        for (char c : str.toLowerCase().toCharArray()) {\n            if ("aeiou".indexOf(c) >= 0) vowels++;\n            else if (c >= \'a\' && c <= \'z\') consonants++;\n        }\n        System.out.println("Vowels: " + vowels);\n        System.out.println("Consonants: " + consonants);\n    }\n}',
'Har character check karo. Agar aeiou mein hai toh vowel, aur agar letter hai toh consonant.',
'Vowels: 3\nConsonants: 7', 24, 'EASY', 'O(n)', 'O(1)', 3),

('Anagram Check',
'Do strings anagram hain ya nahi check karo',
'import java.util.Arrays;\npublic class Anagram {\n    public static void main(String[] args) {\n        String s1 = "listen";\n        String s2 = "silent";\n        char[] a = s1.toLowerCase().toCharArray();\n        char[] b = s2.toLowerCase().toCharArray();\n        Arrays.sort(a);\n        Arrays.sort(b);\n        if (Arrays.equals(a, b))\n            System.out.println(s1 + " and " + s2 + " are Anagrams");\n        else\n            System.out.println("Not Anagrams");\n    }\n}',
'Anagram check ka best tarika: dono strings ko sort karo aur compare karo.',
'listen and silent are Anagrams', 24, 'EASY', 'O(n log n)', 'O(n)', 4),

('Count Words in a Sentence',
'Sentence mein words count karo',
'public class WordCount {\n    public static void main(String[] args) {\n        String sentence = "Hello World this is Java";\n        String[] words = sentence.trim().split("\\\\s+");\n        System.out.println("Sentence: " + sentence);\n        System.out.println("Word count: " + words.length);\n    }\n}',
'split("\\s+") whitespace pe split karta hai. trim() extra spaces remove karta hai.',
'Sentence: Hello World this is Java\nWord count: 5', 24, 'EASY', 'O(n)', 'O(n)', 5);


-- ============================================================
-- ✅ MODERATE PROGRAMS (40 programs)
-- ============================================================

INSERT INTO programs (title, description, code, explanation, sample_output, topic_id, difficulty_level, time_complexity, space_complexity, display_order) VALUES

-- ── Sorting Algorithms (topic 4) ──────────────────────────────────

('Bubble Sort',
'Bubble sort algorithm implement karo',
'public class BubbleSort {\n    public static void main(String[] args) {\n        int[] arr = {64, 34, 25, 12, 22, 11, 90};\n        int n = arr.length;\n        for (int i = 0; i < n - 1; i++) {\n            for (int j = 0; j < n - i - 1; j++) {\n                if (arr[j] > arr[j + 1]) {\n                    int temp = arr[j];\n                    arr[j] = arr[j + 1];\n                    arr[j + 1] = temp;\n                }\n            }\n        }\n        System.out.print("Sorted: ");\n        for (int x : arr) System.out.print(x + " ");\n    }\n}',
'Bubble sort mein adjacent elements compare karte hain aur swap karte hain. Har pass mein sabse bada element end pe pahunch jata hai.',
'Sorted: 11 12 22 25 34 64 90', 4, 'MODERATE', 'O(n²)', 'O(1)', 1),

('Selection Sort',
'Selection sort implement karo',
'public class SelectionSort {\n    public static void main(String[] args) {\n        int[] arr = {64, 25, 12, 22, 11};\n        int n = arr.length;\n        for (int i = 0; i < n - 1; i++) {\n            int minIdx = i;\n            for (int j = i + 1; j < n; j++)\n                if (arr[j] < arr[minIdx]) minIdx = j;\n            int temp = arr[minIdx];\n            arr[minIdx] = arr[i];\n            arr[i] = temp;\n        }\n        System.out.print("Sorted: ");\n        for (int x : arr) System.out.print(x + " ");\n    }\n}',
'Selection sort mein unsorted part ka minimum element dhundho aur sorted part ke saath swap karo.',
'Sorted: 11 12 22 25 64', 4, 'MODERATE', 'O(n²)', 'O(1)', 2),

('Insertion Sort',
'Insertion sort implement karo',
'public class InsertionSort {\n    public static void main(String[] args) {\n        int[] arr = {12, 11, 13, 5, 6};\n        int n = arr.length;\n        for (int i = 1; i < n; i++) {\n            int key = arr[i];\n            int j = i - 1;\n            while (j >= 0 && arr[j] > key) {\n                arr[j + 1] = arr[j];\n                j--;\n            }\n            arr[j + 1] = key;\n        }\n        System.out.print("Sorted: ");\n        for (int x : arr) System.out.print(x + " ");\n    }\n}',
'Insertion sort playing cards jaisa hai. Har element ko uski sahi jagah insert karte hain.',
'Sorted: 5 6 11 12 13', 4, 'MODERATE', 'O(n²)', 'O(1)', 3),

('Merge Sort',
'Divide and conquer merge sort',
'public class MergeSort {\n    static void merge(int[] arr, int l, int m, int r) {\n        int n1 = m - l + 1, n2 = r - m;\n        int[] L = new int[n1], R = new int[n2];\n        for (int i = 0; i < n1; i++) L[i] = arr[l + i];\n        for (int j = 0; j < n2; j++) R[j] = arr[m + 1 + j];\n        int i = 0, j = 0, k = l;\n        while (i < n1 && j < n2) {\n            if (L[i] <= R[j]) arr[k++] = L[i++];\n            else arr[k++] = R[j++];\n        }\n        while (i < n1) arr[k++] = L[i++];\n        while (j < n2) arr[k++] = R[j++];\n    }\n    static void mergeSort(int[] arr, int l, int r) {\n        if (l < r) {\n            int m = (l + r) / 2;\n            mergeSort(arr, l, m);\n            mergeSort(arr, m + 1, r);\n            merge(arr, l, m, r);\n        }\n    }\n    public static void main(String[] args) {\n        int[] arr = {38, 27, 43, 3, 9, 82, 10};\n        mergeSort(arr, 0, arr.length - 1);\n        System.out.print("Sorted: ");\n        for (int x : arr) System.out.print(x + " ");\n    }\n}',
'Merge sort array ko do halves mein divide karta hai, recursively sort karta hai, phir merge karta hai. O(n log n) guaranteed.',
'Sorted: 3 9 10 27 38 43 82', 4, 'MODERATE', 'O(n log n)', 'O(n)', 4),

('Quick Sort',
'Quick sort pivot based sorting',
'public class QuickSort {\n    static int partition(int[] arr, int low, int high) {\n        int pivot = arr[high], i = low - 1;\n        for (int j = low; j < high; j++) {\n            if (arr[j] < pivot) {\n                i++;\n                int t = arr[i]; arr[i] = arr[j]; arr[j] = t;\n            }\n        }\n        int t = arr[i+1]; arr[i+1] = arr[high]; arr[high] = t;\n        return i + 1;\n    }\n    static void quickSort(int[] arr, int low, int high) {\n        if (low < high) {\n            int pi = partition(arr, low, high);\n            quickSort(arr, low, pi - 1);\n            quickSort(arr, pi + 1, high);\n        }\n    }\n    public static void main(String[] args) {\n        int[] arr = {10, 7, 8, 9, 1, 5};\n        quickSort(arr, 0, arr.length - 1);\n        System.out.print("Sorted: ");\n        for (int x : arr) System.out.print(x + " ");\n    }\n}',
'Quick sort ek pivot choose karta hai. Pivot se chhote elements left mein, bade right mein jate hain. Average case O(n log n).',
'Sorted: 1 5 7 8 9 10', 4, 'MODERATE', 'O(n log n)', 'O(log n)', 5),

-- ── Searching (topic 5) ──────────────────────────────────

('Linear Search',
'Array mein element dhundo',
'public class LinearSearch {\n    static int search(int[] arr, int target) {\n        for (int i = 0; i < arr.length; i++)\n            if (arr[i] == target) return i;\n        return -1;\n    }\n    public static void main(String[] args) {\n        int[] arr = {2, 3, 4, 10, 40};\n        int target = 10;\n        int result = search(arr, target);\n        if (result == -1) System.out.println("Not found");\n        else System.out.println("Found at index: " + result);\n    }\n}',
'Linear search ek by ek sab elements check karta hai. Simple hai but O(n) time lagta hai.',
'Found at index: 3', 5, 'MODERATE', 'O(n)', 'O(1)', 1),

('Binary Search',
'Sorted array mein binary search',
'public class BinarySearch {\n    static int binarySearch(int[] arr, int target) {\n        int left = 0, right = arr.length - 1;\n        while (left <= right) {\n            int mid = left + (right - left) / 2;\n            if (arr[mid] == target) return mid;\n            else if (arr[mid] < target) left = mid + 1;\n            else right = mid - 1;\n        }\n        return -1;\n    }\n    public static void main(String[] args) {\n        int[] arr = {2, 3, 4, 10, 40, 50, 60};\n        int target = 40;\n        int result = binarySearch(arr, target);\n        System.out.println(result == -1 ? "Not found" : "Found at index: " + result);\n    }\n}',
'Binary search sorted array mein middle check karta hai aur half eliminate karta hai. O(log n) bahut fast hai.',
'Found at index: 4', 5, 'MODERATE', 'O(log n)', 'O(1)', 2),

-- ── Recursion (topic 6) ──────────────────────────────────

('Tower of Hanoi',
'Tower of Hanoi problem recursion se solve karo',
'public class TowerOfHanoi {\n    static void hanoi(int n, char from, char to, char aux) {\n        if (n == 1) {\n            System.out.println("Move disk 1 from " + from + " to " + to);\n            return;\n        }\n        hanoi(n - 1, from, aux, to);\n        System.out.println("Move disk " + n + " from " + from + " to " + to);\n        hanoi(n - 1, aux, to, from);\n    }\n    public static void main(String[] args) {\n        int n = 3;\n        System.out.println("Tower of Hanoi with " + n + " disks:");\n        hanoi(n, \'A\', \'C\', \'B\');\n    }\n}',
'Tower of Hanoi classic recursion problem hai. n-1 disks aux pe move karo, bada disk target pe, phir n-1 disks target pe.',
'Move disk 1 from A to C\nMove disk 2 from A to B\n...', 6, 'MODERATE', 'O(2^n)', 'O(n)', 1),

('Count Occurrences Recursively',
'Array mein element ki occurrences count karo recursion se',
'public class CountOccurrence {\n    static int count(int[] arr, int n, int target) {\n        if (n == 0) return 0;\n        return (arr[n-1] == target ? 1 : 0) + count(arr, n-1, target);\n    }\n    public static void main(String[] args) {\n        int[] arr = {1, 2, 3, 2, 4, 2, 5};\n        int target = 2;\n        System.out.println("Count of " + target + " = " + count(arr, arr.length, target));\n    }\n}',
'Recursion se har element check karo. Base case: empty array mein 0. Recursive case: last element check karo + baki array.',
'Count of 2 = 3', 6, 'MODERATE', 'O(n)', 'O(n)', 2),

-- ── Arrays (topic 10) ──────────────────────────────────

('Find Max and Min in Array',
'Array mein maximum aur minimum nikalo',
'public class MaxMin {\n    public static void main(String[] args) {\n        int[] arr = {3, 7, 1, 9, 4, 5, 2};\n        int max = arr[0], min = arr[0];\n        for (int x : arr) {\n            if (x > max) max = x;\n            if (x < min) min = x;\n        }\n        System.out.println("Array: 3 7 1 9 4 5 2");\n        System.out.println("Maximum: " + max);\n        System.out.println("Minimum: " + min);\n    }\n}',
'Ek hi loop mein max aur min dono track karo. Pehle element ko dono ka initial value lo.',
'Maximum: 9\nMinimum: 1', 10, 'MODERATE', 'O(n)', 'O(1)', 1),

('Rotate Array',
'Array ko k positions rotate karo',
'public class RotateArray {\n    static void rotate(int[] arr, int k) {\n        int n = arr.length;\n        k = k % n;\n        reverse(arr, 0, n-1);\n        reverse(arr, 0, k-1);\n        reverse(arr, k, n-1);\n    }\n    static void reverse(int[] arr, int l, int r) {\n        while (l < r) { int t = arr[l]; arr[l++] = arr[r]; arr[r--] = t; }\n    }\n    public static void main(String[] args) {\n        int[] arr = {1, 2, 3, 4, 5, 6, 7};\n        rotate(arr, 3);\n        System.out.print("Rotated: ");\n        for (int x : arr) System.out.print(x + " ");\n    }\n}',
'3 reversals trick se O(n) time mein rotate kar sakte hain: whole array reverse, phir first k reverse, phir baaki reverse.',
'Rotated: 5 6 7 1 2 3 4', 10, 'MODERATE', 'O(n)', 'O(1)', 2),

('Remove Duplicates from Array',
'Array se duplicates remove karo',
'import java.util.*;\npublic class RemoveDuplicates {\n    public static void main(String[] args) {\n        int[] arr = {1, 2, 2, 3, 4, 4, 5};\n        Set<Integer> set = new LinkedHashSet<>();\n        for (int x : arr) set.add(x);\n        System.out.print("Unique: ");\n        for (int x : set) System.out.print(x + " ");\n    }\n}',
'LinkedHashSet duplicates automatically remove karta hai aur insertion order bhi maintain karta hai.',
'Unique: 1 2 3 4 5', 10, 'MODERATE', 'O(n)', 'O(n)', 3),

('Two Sum Problem',
'Array mein do elements dhundo jinka sum target ho',
'import java.util.*;\npublic class TwoSum {\n    public static void main(String[] args) {\n        int[] arr = {2, 7, 11, 15};\n        int target = 9;\n        Map<Integer, Integer> map = new HashMap<>();\n        for (int i = 0; i < arr.length; i++) {\n            int complement = target - arr[i];\n            if (map.containsKey(complement)) {\n                System.out.println("Indices: " + map.get(complement) + ", " + i);\n                return;\n            }\n            map.put(arr[i], i);\n        }\n        System.out.println("No solution found");\n    }\n}',
'HashMap use karo. Har element ke liye complement = target - element dhundo. Agar map mein hai toh solution mila.',
'Indices: 0, 1', 10, 'MODERATE', 'O(n)', 'O(n)', 4),

('Kadane Algorithm - Maximum Subarray Sum',
'Maximum sum subarray nikalo',
'public class KadaneAlgo {\n    public static void main(String[] args) {\n        int[] arr = {-2, 1, -3, 4, -1, 2, 1, -5, 4};\n        int maxSum = arr[0], currentSum = arr[0];\n        for (int i = 1; i < arr.length; i++) {\n            currentSum = Math.max(arr[i], currentSum + arr[i]);\n            maxSum = Math.max(maxSum, currentSum);\n        }\n        System.out.println("Maximum Subarray Sum: " + maxSum);\n    }\n}',
'Kadane algorithm: har element pe decide karo ki new subarray start karo ya current mein extend karo.',
'Maximum Subarray Sum: 6', 10, 'MODERATE', 'O(n)', 'O(1)', 5),

-- ── Linked List (topic 11) ──────────────────────────────────

('Singly Linked List - Insert & Display',
'Singly linked list create karo aur display karo',
'public class LinkedList {\n    static class Node { int data; Node next; Node(int d) { data = d; } }\n    static Node head;\n    static void insert(int data) {\n        Node node = new Node(data);\n        if (head == null) { head = node; return; }\n        Node curr = head;\n        while (curr.next != null) curr = curr.next;\n        curr.next = node;\n    }\n    static void display() {\n        Node curr = head;\n        while (curr != null) { System.out.print(curr.data + " -> "); curr = curr.next; }\n        System.out.println("null");\n    }\n    public static void main(String[] args) {\n        insert(1); insert(2); insert(3); insert(4);\n        display();\n    }\n}',
'Linked list mein nodes hote hain. Har node mein data aur next pointer hota hai. Insert ke liye end tak traverse karo.',
'1 -> 2 -> 3 -> 4 -> null', 11, 'MODERATE', 'O(n)', 'O(n)', 1),

('Reverse a Linked List',
'Linked list ko reverse karo',
'public class ReverseLinkedList {\n    static class Node { int data; Node next; Node(int d) { data = d; } }\n    static Node reverse(Node head) {\n        Node prev = null, curr = head;\n        while (curr != null) {\n            Node next = curr.next;\n            curr.next = prev;\n            prev = curr;\n            curr = next;\n        }\n        return prev;\n    }\n    public static void main(String[] args) {\n        Node head = new Node(1);\n        head.next = new Node(2);\n        head.next.next = new Node(3);\n        head.next.next.next = new Node(4);\n        head = reverse(head);\n        Node curr = head;\n        while (curr != null) { System.out.print(curr.data + " "); curr = curr.next; }\n    }\n}',
'Teen pointers use karo: prev, curr, next. curr ka next prev pe point karo, phir sab ek aage badho.',
'4 3 2 1', 11, 'MODERATE', 'O(n)', 'O(1)', 2),

-- ── Stack (topic 12) ──────────────────────────────────

('Stack using Array',
'Array se stack implement karo',
'public class StackArray {\n    static int[] stack = new int[100];\n    static int top = -1;\n    static void push(int x) { stack[++top] = x; System.out.println("Pushed: " + x); }\n    static int pop() { if (top < 0) { System.out.println("Underflow!"); return -1; } return stack[top--]; }\n    static int peek() { return stack[top]; }\n    static boolean isEmpty() { return top < 0; }\n    public static void main(String[] args) {\n        push(10); push(20); push(30);\n        System.out.println("Top: " + peek());\n        System.out.println("Popped: " + pop());\n        System.out.println("Top after pop: " + peek());\n    }\n}',
'Stack LIFO (Last In First Out) data structure hai. Push se top pe add karo, Pop se top se remove karo.',
'Pushed: 10\nPushed: 20\nPushed: 30\nTop: 30\nPopped: 30\nTop after pop: 20', 12, 'MODERATE', 'O(1)', 'O(n)', 1),

('Balanced Parentheses Check',
'Stack se parentheses balanced hain ya nahi check karo',
'import java.util.Stack;\npublic class BalancedParentheses {\n    static boolean isBalanced(String s) {\n        Stack<Character> stack = new Stack<>();\n        for (char c : s.toCharArray()) {\n            if (c == \'(\' || c == \'[\' || c == \'{\') stack.push(c);\n            else if (c == \')\' && (stack.isEmpty() || stack.pop() != \'(\')) return false;\n            else if (c == \']\' && (stack.isEmpty() || stack.pop() != \'[\')) return false;\n            else if (c == \'}\' && (stack.isEmpty() || stack.pop() != \'{\')) return false;\n        }\n        return stack.isEmpty();\n    }\n    public static void main(String[] args) {\n        System.out.println("{[()]} -> " + isBalanced("{[()]}"));\n        System.out.println("{[(])} -> " + isBalanced("{[(])}"));\n    }\n}',
'Opening brackets stack pe push karo. Closing bracket aaye toh stack se pop karo aur match karo.',
'{[()]} -> true\n{[(])} -> false', 12, 'MODERATE', 'O(n)', 'O(n)', 2),

-- ── Queue (topic 13) ──────────────────────────────────

('Queue using Array',
'Array se queue implement karo',
'public class QueueArray {\n    static int[] queue = new int[100];\n    static int front = 0, rear = 0;\n    static void enqueue(int x) { queue[rear++] = x; System.out.println("Enqueued: " + x); }\n    static int dequeue() {\n        if (front == rear) { System.out.println("Queue Empty!"); return -1; }\n        return queue[front++];\n    }\n    public static void main(String[] args) {\n        enqueue(10); enqueue(20); enqueue(30);\n        System.out.println("Dequeued: " + dequeue());\n        System.out.println("Dequeued: " + dequeue());\n    }\n}',
'Queue FIFO (First In First Out) hai. Enqueue rear pe add karta hai, Dequeue front se remove karta hai.',
'Enqueued: 10\nEnqueued: 20\nEnqueued: 30\nDequeued: 10\nDequeued: 20', 13, 'MODERATE', 'O(1)', 'O(n)', 1),

-- ── OOPs (topics 15-19) ──────────────────────────────────

('Classes and Objects - Bank Account',
'Bank account class banao',
'public class BankAccount {\n    private String owner;\n    private double balance;\n    public BankAccount(String owner, double balance) {\n        this.owner = owner;\n        this.balance = balance;\n    }\n    public void deposit(double amount) {\n        balance += amount;\n        System.out.println("Deposited: " + amount + " | Balance: " + balance);\n    }\n    public void withdraw(double amount) {\n        if (amount > balance) { System.out.println("Insufficient funds!"); return; }\n        balance -= amount;\n        System.out.println("Withdrawn: " + amount + " | Balance: " + balance);\n    }\n    public void display() { System.out.println("Owner: " + owner + " | Balance: " + balance); }\n    public static void main(String[] args) {\n        BankAccount acc = new BankAccount("Ayush", 1000);\n        acc.display();\n        acc.deposit(500);\n        acc.withdraw(200);\n    }\n}',
'Class ek blueprint hai. Object class ka instance hai. Encapsulation ke liye private fields aur public methods use karo.',
'Owner: Ayush | Balance: 1000.0\nDeposited: 500.0 | Balance: 1500.0\nWithdrawn: 200.0 | Balance: 1300.0', 15, 'MODERATE', 'O(1)', 'O(1)', 1),

('Inheritance - Animal Hierarchy',
'Animal class hierarchy banao inheritance se',
'public class InheritanceDemo {\n    static class Animal {\n        String name;\n        Animal(String name) { this.name = name; }\n        void makeSound() { System.out.println(name + " makes a sound"); }\n        void eat() { System.out.println(name + " is eating"); }\n    }\n    static class Dog extends Animal {\n        Dog(String name) { super(name); }\n        @Override void makeSound() { System.out.println(name + " says: Woof!"); }\n    }\n    static class Cat extends Animal {\n        Cat(String name) { super(name); }\n        @Override void makeSound() { System.out.println(name + " says: Meow!"); }\n    }\n    public static void main(String[] args) {\n        Animal dog = new Dog("Tommy");\n        Animal cat = new Cat("Kitty");\n        dog.makeSound(); dog.eat();\n        cat.makeSound(); cat.eat();\n    }\n}',
'Inheritance se code reuse hota hai. Dog aur Cat Animal ke child classes hain. super() se parent constructor call karo.',
'Tommy says: Woof!\nTommy is eating\nKitty says: Meow!\nKitty is eating', 16, 'MODERATE', 'O(1)', 'O(1)', 1),

('Polymorphism - Shape Area',
'Shape area calculate karo polymorphism se',
'public class PolymorphismDemo {\n    static abstract class Shape {\n        abstract double area();\n        void display() { System.out.println(getClass().getSimpleName() + " area: " + String.format("%.2f", area())); }\n    }\n    static class Circle extends Shape {\n        double radius;\n        Circle(double r) { radius = r; }\n        double area() { return Math.PI * radius * radius; }\n    }\n    static class Rectangle extends Shape {\n        double width, height;\n        Rectangle(double w, double h) { width = w; height = h; }\n        double area() { return width * height; }\n    }\n    static class Triangle extends Shape {\n        double base, height;\n        Triangle(double b, double h) { base = b; height = h; }\n        double area() { return 0.5 * base * height; }\n    }\n    public static void main(String[] args) {\n        Shape[] shapes = { new Circle(7), new Rectangle(5, 4), new Triangle(6, 8) };\n        for (Shape s : shapes) s.display();\n    }\n}',
'Polymorphism mein ek hi method alag alag behavior karta hai. Runtime pe actual object ka method call hota hai.',
'Circle area: 153.94\nRectangle area: 20.00\nTriangle area: 24.00', 17, 'MODERATE', 'O(1)', 'O(1)', 1),

('Interface - Printable and Saveable',
'Interface implement karo',
'public class InterfaceDemo {\n    interface Printable { void print(); }\n    interface Saveable { void save(); }\n    static class Document implements Printable, Saveable {\n        String content;\n        Document(String c) { content = c; }\n        public void print() { System.out.println("Printing: " + content); }\n        public void save() { System.out.println("Saving: " + content); }\n    }\n    public static void main(String[] args) {\n        Document doc = new Document("Hello CodeJamm!");\n        doc.print();\n        doc.save();\n        Printable p = doc;\n        p.print();\n    }\n}',
'Interface ek contract hai. Multiple interfaces implement kar sakte hain. Interface mein sirf method signatures hoti hain.',
'Printing: Hello CodeJamm!\nSaving: Hello CodeJamm!\nPrinting: Hello CodeJamm!', 18, 'MODERATE', 'O(1)', 'O(1)', 1),

('Encapsulation - Student Class',
'Encapsulation demonstrate karo getters/setters se',
'public class EncapsulationDemo {\n    static class Student {\n        private String name;\n        private int age;\n        private double marks;\n        public Student(String name, int age, double marks) {\n            this.name = name;\n            setAge(age);\n            setMarks(marks);\n        }\n        public String getName() { return name; }\n        public void setAge(int age) {\n            if (age > 0 && age < 100) this.age = age;\n            else System.out.println("Invalid age!");\n        }\n        public void setMarks(double marks) {\n            if (marks >= 0 && marks <= 100) this.marks = marks;\n            else System.out.println("Invalid marks!");\n        }\n        public void display() {\n            System.out.println("Name: " + name + " | Age: " + age + " | Marks: " + marks);\n        }\n    }\n    public static void main(String[] args) {\n        Student s = new Student("Ayush", 20, 92.5);\n        s.display();\n        s.setAge(-5);\n        s.setMarks(150);\n    }\n}',
'Encapsulation mein data private karo aur access ke liye public getters/setters banao. Setters mein validation add karo.',
'Name: Ayush | Age: 20 | Marks: 92.5\nInvalid age!\nInvalid marks!', 19, 'MODERATE', 'O(1)', 'O(1)', 1),

-- ── Matrix (topic 22) ──────────────────────────────────

('Matrix Addition',
'Do matrices add karo',
'public class MatrixAdd {\n    public static void main(String[] args) {\n        int[][] A = {{1,2,3},{4,5,6},{7,8,9}};\n        int[][] B = {{9,8,7},{6,5,4},{3,2,1}};\n        int[][] C = new int[3][3];\n        for (int i = 0; i < 3; i++)\n            for (int j = 0; j < 3; j++)\n                C[i][j] = A[i][j] + B[i][j];\n        System.out.println("Result Matrix:");\n        for (int[] row : C) {\n            for (int x : row) System.out.printf("%4d", x);\n            System.out.println();\n        }\n    }\n}',
'Matrix addition mein same position ke elements add karte hain. Dono matrices ka same size hona zaroori hai.',
'Result Matrix:\n  10  10  10\n  10  10  10\n  10  10  10', 22, 'MODERATE', 'O(n²)', 'O(n²)', 1),

('Matrix Multiplication',
'Do matrices multiply karo',
'public class MatrixMul {\n    public static void main(String[] args) {\n        int[][] A = {{1,2},{3,4}};\n        int[][] B = {{5,6},{7,8}};\n        int[][] C = new int[2][2];\n        for (int i = 0; i < 2; i++)\n            for (int j = 0; j < 2; j++)\n                for (int k = 0; k < 2; k++)\n                    C[i][j] += A[i][k] * B[k][j];\n        System.out.println("Result:");\n        for (int[] row : C) {\n            for (int x : row) System.out.printf("%4d", x);\n            System.out.println();\n        }\n    }\n}',
'Matrix multiplication mein row × column karte hain. A[m×n] × B[n×p] = C[m×p]. Teen nested loops lagti hain.',
'Result:\n  19  22\n  43  50', 22, 'MODERATE', 'O(n³)', 'O(n²)', 2),

('Transpose of Matrix',
'Matrix ka transpose nikalo',
'public class MatrixTranspose {\n    public static void main(String[] args) {\n        int[][] mat = {{1,2,3},{4,5,6},{7,8,9}};\n        int n = mat.length;\n        System.out.println("Transpose:");\n        for (int i = 0; i < n; i++) {\n            for (int j = 0; j < n; j++)\n                System.out.printf("%4d", mat[j][i]);\n            System.out.println();\n        }\n    }\n}',
'Transpose mein rows aur columns swap hote hain. mat[i][j] ki jagah mat[j][i] print karo.',
'Transpose:\n   1   4   7\n   2   5   8\n   3   6   9', 22, 'MODERATE', 'O(n²)', 'O(1)', 3),

-- ── String Algorithms (topic 25) ──────────────────────────────────

('Longest Common Subsequence',
'Do strings ka longest common subsequence nikalo',
'public class LCS {\n    public static void main(String[] args) {\n        String s1 = "ABCBDAB", s2 = "BDCAB";\n        int m = s1.length(), n = s2.length();\n        int[][] dp = new int[m+1][n+1];\n        for (int i = 1; i <= m; i++)\n            for (int j = 1; j <= n; j++)\n                if (s1.charAt(i-1) == s2.charAt(j-1)) dp[i][j] = dp[i-1][j-1] + 1;\n                else dp[i][j] = Math.max(dp[i-1][j], dp[i][j-1]);\n        System.out.println("LCS Length: " + dp[m][n]);\n    }\n}',
'LCS DP problem hai. Agar characters match karein toh dp[i][j] = dp[i-1][j-1] + 1, warna max of dp[i-1][j] and dp[i][j-1].',
'LCS Length: 4', 25, 'MODERATE', 'O(m×n)', 'O(m×n)', 1),

('Check if String has All Unique Characters',
'String mein sab characters unique hain ya nahi',
'import java.util.*;\npublic class UniqueChars {\n    public static void main(String[] args) {\n        String[] tests = {"abcdef", "hello", "CodeJamm"};\n        for (String s : tests) {\n            Set<Character> set = new HashSet<>();\n            boolean unique = true;\n            for (char c : s.toCharArray()) {\n                if (!set.add(c)) { unique = false; break; }\n            }\n            System.out.println(s + " -> " + (unique ? "All unique" : "Has duplicates"));\n        }\n    }\n}',
'HashSet mein duplicate add nahi hota. add() false return karta hai agar element already exist karta ho.',
'abcdef -> All unique\nhello -> Has duplicates\nCodeJamm -> Has duplicates', 25, 'MODERATE', 'O(n)', 'O(n)', 2),

-- ── Collections (topic 26-28) ──────────────────────────────────

('ArrayList Operations',
'ArrayList ke saare basic operations',
'import java.util.*;\npublic class ArrayListDemo {\n    public static void main(String[] args) {\n        ArrayList<String> list = new ArrayList<>();\n        list.add("Java"); list.add("Python"); list.add("C++"); list.add("JavaScript");\n        System.out.println("List: " + list);\n        list.remove("Python");\n        System.out.println("After remove: " + list);\n        Collections.sort(list);\n        System.out.println("Sorted: " + list);\n        System.out.println("Size: " + list.size());\n        System.out.println("Contains Java: " + list.contains("Java"));\n    }\n}',
'ArrayList dynamic array hai. add(), remove(), sort(), size(), contains() common methods hain.',
'List: [Java, Python, C++, JavaScript]\nAfter remove: [Java, C++, JavaScript]\nSorted: [C++, Java, JavaScript]', 26, 'MODERATE', 'O(n)', 'O(n)', 1),

('HashMap - Word Frequency',
'Sentence mein har word ki frequency count karo',
'import java.util.*;\npublic class WordFrequency {\n    public static void main(String[] args) {\n        String sentence = "java is great java is easy java";\n        Map<String, Integer> freq = new HashMap<>();\n        for (String word : sentence.split(" ")) {\n            freq.put(word, freq.getOrDefault(word, 0) + 1);\n        }\n        System.out.println("Word Frequencies:");\n        for (Map.Entry<String, Integer> e : freq.entrySet()) {\n            System.out.println(e.getKey() + " -> " + e.getValue());\n        }\n    }\n}',
'HashMap key-value pairs store karta hai. getOrDefault() se default value lo agar key exist nahi karti.',
'java -> 3\nis -> 2\ngreat -> 1\neasy -> 1', 27, 'MODERATE', 'O(n)', 'O(n)', 1);


-- ============================================================
-- ✅ ADVANCED/HARD PROGRAMS (30 programs)
-- ============================================================

INSERT INTO programs (title, description, code, explanation, sample_output, topic_id, difficulty_level, time_complexity, space_complexity, display_order) VALUES

-- ── Dynamic Programming (topic 7) ──────────────────────────────────

('Fibonacci with Memoization',
'Memoization se Fibonacci efficiently compute karo',
'import java.util.*;\npublic class FibMemo {\n    static Map<Integer, Long> memo = new HashMap<>();\n    static long fib(int n) {\n        if (n <= 1) return n;\n        if (memo.containsKey(n)) return memo.get(n);\n        long result = fib(n-1) + fib(n-2);\n        memo.put(n, result);\n        return result;\n    }\n    public static void main(String[] args) {\n        for (int i = 0; i <= 10; i++)\n            System.out.print(fib(i) + " ");\n        System.out.println();\n        System.out.println("fib(50) = " + fib(50));\n    }\n}',
'Memoization mein computed results store karte hain. Isse O(2^n) se O(n) ho jata hai. Top-down DP approach.',
'0 1 1 2 3 5 8 13 21 34 55\nfib(50) = 12586269025', 7, 'ADVANCED', 'O(n)', 'O(n)', 1),

('0/1 Knapsack Problem',
'Knapsack problem DP se solve karo',
'public class Knapsack {\n    public static void main(String[] args) {\n        int[] weights = {2, 3, 4, 5};\n        int[] values  = {3, 4, 5, 6};\n        int W = 8, n = weights.length;\n        int[][] dp = new int[n+1][W+1];\n        for (int i = 1; i <= n; i++) {\n            for (int w = 0; w <= W; w++) {\n                if (weights[i-1] <= w)\n                    dp[i][w] = Math.max(dp[i-1][w], values[i-1] + dp[i-1][w - weights[i-1]]);\n                else\n                    dp[i][w] = dp[i-1][w];\n            }\n        }\n        System.out.println("Max value in knapsack: " + dp[n][W]);\n    }\n}',
'Knapsack: har item ke liye decide karo include karein ya nahi. dp[i][w] = i items consider karke weight w mein max value.',
'Max value in knapsack: 10', 7, 'ADVANCED', 'O(n×W)', 'O(n×W)', 2),

('Coin Change Problem',
'Minimum coins use karke amount banao',
'import java.util.*;\npublic class CoinChange {\n    public static void main(String[] args) {\n        int[] coins = {1, 5, 10, 25};\n        int amount = 36;\n        int[] dp = new int[amount + 1];\n        Arrays.fill(dp, amount + 1);\n        dp[0] = 0;\n        for (int i = 1; i <= amount; i++)\n            for (int c : coins)\n                if (c <= i) dp[i] = Math.min(dp[i], dp[i-c] + 1);\n        System.out.println("Min coins for " + amount + " = " + (dp[amount] > amount ? -1 : dp[amount]));\n    }\n}',
'Bottom-up DP: dp[i] = minimum coins for amount i. Har coin try karo aur minimum lo.',
'Min coins for 36 = 3', 7, 'ADVANCED', 'O(amount × coins)', 'O(amount)', 3),

('Longest Increasing Subsequence',
'Array mein longest increasing subsequence dhundo',
'import java.util.*;\npublic class LIS {\n    public static void main(String[] args) {\n        int[] arr = {10, 9, 2, 5, 3, 7, 101, 18};\n        int n = arr.length;\n        int[] dp = new int[n];\n        Arrays.fill(dp, 1);\n        for (int i = 1; i < n; i++)\n            for (int j = 0; j < i; j++)\n                if (arr[j] < arr[i]) dp[i] = Math.max(dp[i], dp[j] + 1);\n        int lis = 0;\n        for (int x : dp) lis = Math.max(lis, x);\n        System.out.println("LIS length: " + lis);\n    }\n}',
'dp[i] = longest increasing subsequence ending at index i. Har i ke liye, j<i aur arr[j]<arr[i] wale sab j check karo.',
'LIS length: 4', 7, 'ADVANCED', 'O(n²)', 'O(n)', 4),

('Matrix Chain Multiplication',
'Matrix chain multiply karne ka optimal order dhundo',
'public class MatrixChain {\n    static int matrixChain(int[] p, int n) {\n        int[][] dp = new int[n][n];\n        for (int len = 2; len < n; len++) {\n            for (int i = 1; i < n - len + 1; i++) {\n                int j = i + len - 1;\n                dp[i][j] = Integer.MAX_VALUE;\n                for (int k = i; k < j; k++) {\n                    int cost = dp[i][k] + dp[k+1][j] + p[i-1]*p[k]*p[j];\n                    dp[i][j] = Math.min(dp[i][j], cost);\n                }\n            }\n        }\n        return dp[1][n-1];\n    }\n    public static void main(String[] args) {\n        int[] p = {40, 20, 30, 10, 30};\n        System.out.println("Minimum multiplications: " + matrixChain(p, p.length));\n    }\n}',
'Matrix chain DP: dp[i][j] = minimum cost to multiply matrices i to j. Har possible split point try karo.',
'Minimum multiplications: 26000', 7, 'ADVANCED', 'O(n³)', 'O(n²)', 5),

('Edit Distance (Levenshtein)',
'Do strings ke beech minimum edit operations nikalo',
'public class EditDistance {\n    public static void main(String[] args) {\n        String s1 = "sunday", s2 = "saturday";\n        int m = s1.length(), n = s2.length();\n        int[][] dp = new int[m+1][n+1];\n        for (int i = 0; i <= m; i++) dp[i][0] = i;\n        for (int j = 0; j <= n; j++) dp[0][j] = j;\n        for (int i = 1; i <= m; i++)\n            for (int j = 1; j <= n; j++)\n                if (s1.charAt(i-1) == s2.charAt(j-1)) dp[i][j] = dp[i-1][j-1];\n                else dp[i][j] = 1 + Math.min(dp[i-1][j-1], Math.min(dp[i-1][j], dp[i][j-1]));\n        System.out.println("Edit distance: " + dp[m][n]);\n    }\n}',
'Edit distance = minimum insert, delete, replace operations. dp[i][j] = s1[0..i] ko s2[0..j] mein convert karne ki cost.',
'Edit distance: 3', 7, 'ADVANCED', 'O(m×n)', 'O(m×n)', 6),

-- ── Graph Algorithms (topic 8) ──────────────────────────────────

('BFS - Breadth First Search',
'Graph ka BFS traversal karo',
'import java.util.*;\npublic class BFS {\n    static int V = 6;\n    static List<List<Integer>> adj = new ArrayList<>();\n    static void bfs(int start) {\n        boolean[] visited = new boolean[V];\n        Queue<Integer> queue = new LinkedList<>();\n        visited[start] = true;\n        queue.add(start);\n        System.out.print("BFS: ");\n        while (!queue.isEmpty()) {\n            int node = queue.poll();\n            System.out.print(node + " ");\n            for (int neighbor : adj.get(node))\n                if (!visited[neighbor]) { visited[neighbor] = true; queue.add(neighbor); }\n        }\n    }\n    public static void main(String[] args) {\n        for (int i = 0; i < V; i++) adj.add(new ArrayList<>());\n        adj.get(0).add(1); adj.get(0).add(2);\n        adj.get(1).add(3); adj.get(1).add(4);\n        adj.get(2).add(5);\n        bfs(0);\n    }\n}',
'BFS queue use karta hai. Level by level traverse karta hai. Shortest path ke liye best hai.',
'BFS: 0 1 2 3 4 5', 8, 'ADVANCED', 'O(V+E)', 'O(V)', 1),

('DFS - Depth First Search',
'Graph ka DFS traversal karo',
'import java.util.*;\npublic class DFS {\n    static int V = 6;\n    static List<List<Integer>> adj = new ArrayList<>();\n    static boolean[] visited = new boolean[V];\n    static void dfs(int node) {\n        visited[node] = true;\n        System.out.print(node + " ");\n        for (int neighbor : adj.get(node))\n            if (!visited[neighbor]) dfs(neighbor);\n    }\n    public static void main(String[] args) {\n        for (int i = 0; i < V; i++) adj.add(new ArrayList<>());\n        adj.get(0).add(1); adj.get(0).add(2);\n        adj.get(1).add(3); adj.get(1).add(4);\n        adj.get(2).add(5);\n        System.out.print("DFS: ");\n        dfs(0);\n    }\n}',
'DFS recursion use karta hai. Ek path pe jitna ho sake utna deep jata hai, phir backtrack karta hai.',
'DFS: 0 1 3 4 2 5', 8, 'ADVANCED', 'O(V+E)', 'O(V)', 2),

('Dijkstra Shortest Path',
'Weighted graph mein shortest path nikalo',
'import java.util.*;\npublic class Dijkstra {\n    static final int INF = Integer.MAX_VALUE;\n    public static void main(String[] args) {\n        int V = 5;\n        int[][] graph = {\n            {0, 10, 0,  0, 5},\n            {0, 0,  1,  0, 2},\n            {0, 0,  0,  4, 0},\n            {7, 0,  6,  0, 0},\n            {0, 3,  9,  2, 0}\n        };\n        int src = 0;\n        int[] dist = new int[V];\n        boolean[] visited = new boolean[V];\n        Arrays.fill(dist, INF);\n        dist[src] = 0;\n        for (int i = 0; i < V - 1; i++) {\n            int u = -1;\n            for (int v = 0; v < V; v++)\n                if (!visited[v] && (u == -1 || dist[v] < dist[u])) u = v;\n            visited[u] = true;\n            for (int v = 0; v < V; v++)\n                if (graph[u][v] != 0 && dist[u] != INF && dist[u] + graph[u][v] < dist[v])\n                    dist[v] = dist[u] + graph[u][v];\n        }\n        System.out.println("Shortest distances from node " + src + ":");\n        for (int i = 0; i < V; i++)\n            System.out.println("To " + i + " = " + (dist[i] == INF ? "INF" : dist[i]));\n    }\n}',
'Dijkstra greedy algorithm hai. Har step mein unvisited node with minimum distance pick karo aur uske neighbors update karo.',
'Shortest distances from node 0:\nTo 0 = 0\nTo 1 = 8\nTo 2 = 9\nTo 3 = 7\nTo 4 = 5', 8, 'ADVANCED', 'O(V²)', 'O(V)', 3),

('Detect Cycle in Graph',
'Undirected graph mein cycle detect karo',
'import java.util.*;\npublic class CycleDetect {\n    static int V = 5;\n    static List<List<Integer>> adj = new ArrayList<>();\n    static boolean dfs(int node, int parent, boolean[] visited) {\n        visited[node] = true;\n        for (int neighbor : adj.get(node)) {\n            if (!visited[neighbor]) {\n                if (dfs(neighbor, node, visited)) return true;\n            } else if (neighbor != parent) return true;\n        }\n        return false;\n    }\n    public static void main(String[] args) {\n        for (int i = 0; i < V; i++) adj.add(new ArrayList<>());\n        adj.get(0).add(1); adj.get(1).add(0);\n        adj.get(0).add(2); adj.get(2).add(0);\n        adj.get(1).add(2); adj.get(2).add(1);\n        boolean[] visited = new boolean[V];\n        System.out.println("Cycle exists: " + dfs(0, -1, visited));\n    }\n}',
'DFS mein agar visited neighbor mila jo parent nahi hai, toh cycle hai. Parent track karna zaroori hai.',
'Cycle exists: true', 8, 'ADVANCED', 'O(V+E)', 'O(V)', 4),

-- ── Backtracking (topic 9) ──────────────────────────────────

('N-Queens Problem',
'NxN board pe N queens place karo',
'public class NQueens {\n    static int N = 4;\n    static int[][] board = new int[N][N];\n    static boolean isSafe(int row, int col) {\n        for (int i = 0; i < row; i++) if (board[i][col] == 1) return false;\n        for (int i = row-1, j = col-1; i >= 0 && j >= 0; i--, j--) if (board[i][j] == 1) return false;\n        for (int i = row-1, j = col+1; i >= 0 && j < N; i--, j++) if (board[i][j] == 1) return false;\n        return true;\n    }\n    static boolean solve(int row) {\n        if (row == N) {\n            for (int[] r : board) {\n                for (int x : r) System.out.print(x == 1 ? "Q " : ". ");\n                System.out.println();\n            }\n            return true;\n        }\n        for (int col = 0; col < N; col++) {\n            if (isSafe(row, col)) {\n                board[row][col] = 1;\n                if (solve(row + 1)) return true;\n                board[row][col] = 0;\n            }\n        }\n        return false;\n    }\n    public static void main(String[] args) { solve(0); }\n}',
'N-Queens backtracking: har row mein ek queen place karo. Agar position safe hai toh agla row try karo, warna backtrack.',
'. Q . .\n. . . Q\nQ . . .\n. . Q .', 9, 'ADVANCED', 'O(N!)', 'O(N²)', 1),

('Sudoku Solver',
'Backtracking se Sudoku solve karo',
'public class SudokuSolver {\n    static boolean isValid(int[][] board, int row, int col, int num) {\n        for (int i = 0; i < 9; i++)\n            if (board[row][i] == num || board[i][col] == num) return false;\n        int r = row - row % 3, c = col - col % 3;\n        for (int i = 0; i < 3; i++)\n            for (int j = 0; j < 3; j++)\n                if (board[r+i][c+j] == num) return false;\n        return true;\n    }\n    static boolean solve(int[][] board) {\n        for (int i = 0; i < 9; i++)\n            for (int j = 0; j < 9; j++)\n                if (board[i][j] == 0) {\n                    for (int num = 1; num <= 9; num++)\n                        if (isValid(board, i, j, num)) {\n                            board[i][j] = num;\n                            if (solve(board)) return true;\n                            board[i][j] = 0;\n                        }\n                    return false;\n                }\n        return true;\n    }\n    public static void main(String[] args) {\n        int[][] board = {\n            {5,3,0,0,7,0,0,0,0},{6,0,0,1,9,5,0,0,0},{0,9,8,0,0,0,0,6,0},\n            {8,0,0,0,6,0,0,0,3},{4,0,0,8,0,3,0,0,1},{7,0,0,0,2,0,0,0,6},\n            {0,6,0,0,0,0,2,8,0},{0,0,0,4,1,9,0,0,5},{0,0,0,0,8,0,0,7,9}\n        };\n        if (solve(board)) {\n            for (int[] row : board) {\n                for (int x : row) System.out.print(x + " ");\n                System.out.println();\n            }\n        }\n    }\n}',
'Sudoku backtracking: empty cell dhundo, 1-9 try karo. Valid hai toh next cell solve karo, nahi toh backtrack.',
'5 3 4 6 7 8 9 1 2\n6 7 2 1 9 5 3 4 8\n...', 9, 'ADVANCED', 'O(9^(n*n))', 'O(n²)', 2),

('All Permutations of a String',
'String ke saare permutations nikalo',
'import java.util.*;\npublic class Permutations {\n    static List<String> result = new ArrayList<>();\n    static void permute(char[] arr, int start) {\n        if (start == arr.length) { result.add(new String(arr)); return; }\n        for (int i = start; i < arr.length; i++) {\n            char t = arr[start]; arr[start] = arr[i]; arr[i] = t;\n            permute(arr, start + 1);\n            t = arr[start]; arr[start] = arr[i]; arr[i] = t;\n        }\n    }\n    public static void main(String[] args) {\n        String s = "ABC";\n        permute(s.toCharArray(), 0);\n        System.out.println("All permutations of " + s + ":");\n        result.forEach(System.out::println);\n    }\n}',
'Backtracking se permutations: har position ke liye remaining characters swap karo, recurse karo, phir swap wapas karo.',
'ABC\nACB\nBAC\nBCA\nCAB\nCBA', 9, 'ADVANCED', 'O(n!)', 'O(n)', 3),

('Word Search in Grid',
'Grid mein word dhundo backtracking se',
'public class WordSearch {\n    static boolean search(char[][] board, String word, int i, int j, int k) {\n        if (k == word.length()) return true;\n        if (i < 0 || i >= board.length || j < 0 || j >= board[0].length || board[i][j] != word.charAt(k)) return false;\n        char temp = board[i][j];\n        board[i][j] = \'#\';\n        boolean found = search(board, word, i+1, j, k+1) || search(board, word, i-1, j, k+1) ||\n                        search(board, word, i, j+1, k+1) || search(board, word, i, j-1, k+1);\n        board[i][j] = temp;\n        return found;\n    }\n    public static void main(String[] args) {\n        char[][] board = {\'A\',\'B\',\'C\',\'E\'},{\'S\',\'F\',\'C\',\'S\'},{\'A\',\'D\',\'E\',\'E\'}};\n        String word = "ABCCED";\n        boolean found = false;\n        for (int i = 0; i < board.length && !found; i++)\n            for (int j = 0; j < board[0].length && !found; j++)\n                if (search(board, word, i, j, 0)) found = true;\n        System.out.println("Word \\"" + word + "\\" found: " + found);\n    }\n}',
'Har cell se DFS shuru karo. Character match kare toh 4 directions mein explore karo. Visited mark karo, backtrack pe restore karo.',
'Word "ABCCED" found: true', 9, 'ADVANCED', 'O(M×N×4^L)', 'O(L)', 4),

-- ── Trees (topic 14) ──────────────────────────────────

('Binary Search Tree - Insert & Search',
'BST mein insert aur search karo',
'public class BST {\n    static class Node { int val; Node left, right; Node(int v) { val = v; } }\n    static Node insert(Node root, int val) {\n        if (root == null) return new Node(val);\n        if (val < root.val) root.left = insert(root.left, val);\n        else if (val > root.val) root.right = insert(root.right, val);\n        return root;\n    }\n    static boolean search(Node root, int val) {\n        if (root == null) return false;\n        if (root.val == val) return true;\n        if (val < root.val) return search(root.left, val);\n        return search(root.right, val);\n    }\n    static void inorder(Node root) {\n        if (root == null) return;\n        inorder(root.left); System.out.print(root.val + " "); inorder(root.right);\n    }\n    public static void main(String[] args) {\n        Node root = null;\n        for (int v : new int[]{5, 3, 7, 1, 4, 6, 8}) root = insert(root, v);\n        System.out.print("Inorder: "); inorder(root); System.out.println();\n        System.out.println("Search 4: " + search(root, 4));\n        System.out.println("Search 9: " + search(root, 9));\n    }\n}',
'BST mein left < root < right. Inorder traversal sorted order deta hai. Search O(log n) average case.',
'Inorder: 1 3 4 5 6 7 8\nSearch 4: true\nSearch 9: false', 14, 'ADVANCED', 'O(log n)', 'O(n)', 1),

('Level Order Traversal (BFS on Tree)',
'Tree ka level order traversal karo',
'import java.util.*;\npublic class LevelOrder {\n    static class Node { int val; Node left, right; Node(int v) { val = v; } }\n    static void levelOrder(Node root) {\n        if (root == null) return;\n        Queue<Node> q = new LinkedList<>();\n        q.add(root);\n        while (!q.isEmpty()) {\n            int size = q.size();\n            for (int i = 0; i < size; i++) {\n                Node node = q.poll();\n                System.out.print(node.val + " ");\n                if (node.left  != null) q.add(node.left);\n                if (node.right != null) q.add(node.right);\n            }\n            System.out.println();\n        }\n    }\n    public static void main(String[] args) {\n        Node root = new Node(1);\n        root.left = new Node(2); root.right = new Node(3);\n        root.left.left = new Node(4); root.left.right = new Node(5);\n        root.right.left = new Node(6); root.right.right = new Node(7);\n        System.out.println("Level Order:");\n        levelOrder(root);\n    }\n}',
'Queue use karke level by level traverse karo. Har level ke liye queue size track karo.',
'Level Order:\n1\n2 3\n4 5 6 7', 14, 'ADVANCED', 'O(n)', 'O(n)', 2),

('Height of Binary Tree',
'Binary tree ki height nikalo',
'public class TreeHeight {\n    static class Node { int val; Node left, right; Node(int v) { val = v; } }\n    static int height(Node root) {\n        if (root == null) return 0;\n        return 1 + Math.max(height(root.left), height(root.right));\n    }\n    public static void main(String[] args) {\n        Node root = new Node(1);\n        root.left = new Node(2); root.right = new Node(3);\n        root.left.left = new Node(4); root.left.right = new Node(5);\n        root.left.left.left = new Node(8);\n        System.out.println("Height of tree: " + height(root));\n    }\n}',
'Tree ki height = 1 + max(left subtree height, right subtree height). Base case: null node ki height 0.',
'Height of tree: 4', 14, 'ADVANCED', 'O(n)', 'O(h)', 3),

('Check if Tree is Balanced',
'Binary tree balanced hai ya nahi check karo',
'public class BalancedTree {\n    static class Node { int val; Node left, right; Node(int v) { val = v; } }\n    static int checkHeight(Node root) {\n        if (root == null) return 0;\n        int left  = checkHeight(root.left);\n        if (left  == -1) return -1;\n        int right = checkHeight(root.right);\n        if (right == -1) return -1;\n        if (Math.abs(left - right) > 1) return -1;\n        return 1 + Math.max(left, right);\n    }\n    public static void main(String[] args) {\n        Node root = new Node(1);\n        root.left = new Node(2); root.right = new Node(3);\n        root.left.left = new Node(4);\n        System.out.println("Balanced: " + (checkHeight(root) != -1));\n        root.left.left.left = new Node(5);\n        System.out.println("Balanced: " + (checkHeight(root) != -1));\n    }\n}',
'Height return karo, -1 agar unbalanced. Har node pe left aur right height ka difference check karo.',
'Balanced: true\nBalanced: false', 14, 'ADVANCED', 'O(n)', 'O(h)', 4),

('Lowest Common Ancestor in BST',
'BST mein do nodes ka LCA nikalo',
'public class LCA {\n    static class Node { int val; Node left, right; Node(int v) { val = v; } }\n    static Node lca(Node root, int p, int q) {\n        if (root == null) return null;\n        if (p < root.val && q < root.val) return lca(root.left,  p, q);\n        if (p > root.val && q > root.val) return lca(root.right, p, q);\n        return root;\n    }\n    public static void main(String[] args) {\n        Node root = new Node(6);\n        root.left = new Node(2); root.right = new Node(8);\n        root.left.left = new Node(0); root.left.right = new Node(4);\n        root.right.left = new Node(7); root.right.right = new Node(9);\n        System.out.println("LCA(2,8) = " + lca(root, 2, 8).val);\n        System.out.println("LCA(2,4) = " + lca(root, 2, 4).val);\n    }\n}',
'BST mein LCA: agar dono values root se chote hain toh left mein, dono bade hain toh right mein, warna root hi LCA hai.',
'LCA(2,8) = 6\nLCA(2,4) = 2', 14, 'ADVANCED', 'O(h)', 'O(h)', 5),

-- ── More Advanced Programs ──────────────────────────────────

('Heap Sort',
'Heap data structure se sorting karo',
'public class HeapSort {\n    static void heapify(int[] arr, int n, int i) {\n        int largest = i, left = 2*i+1, right = 2*i+2;\n        if (left  < n && arr[left]  > arr[largest]) largest = left;\n        if (right < n && arr[right] > arr[largest]) largest = right;\n        if (largest != i) {\n            int t = arr[i]; arr[i] = arr[largest]; arr[largest] = t;\n            heapify(arr, n, largest);\n        }\n    }\n    static void heapSort(int[] arr) {\n        int n = arr.length;\n        for (int i = n/2-1; i >= 0; i--) heapify(arr, n, i);\n        for (int i = n-1; i > 0; i--) {\n            int t = arr[0]; arr[0] = arr[i]; arr[i] = t;\n            heapify(arr, i, 0);\n        }\n    }\n    public static void main(String[] args) {\n        int[] arr = {12, 11, 13, 5, 6, 7};\n        heapSort(arr);\n        System.out.print("Sorted: ");\n        for (int x : arr) System.out.print(x + " ");\n    }\n}',
'Heap sort pehle max-heap banata hai, phir root (max) ko end mein swap karta hai aur heap size ghata deta hai.',
'Sorted: 5 6 7 11 12 13', 7, 'ADVANCED', 'O(n log n)', 'O(1)', 7),

('Trie Data Structure',
'Trie implement karo words store karne ke liye',
'public class Trie {\n    static class Node {\n        Node[] children = new Node[26];\n        boolean isEnd = false;\n    }\n    static Node root = new Node();\n    static void insert(String word) {\n        Node curr = root;\n        for (char c : word.toCharArray()) {\n            int idx = c - \'a\';\n            if (curr.children[idx] == null) curr.children[idx] = new Node();\n            curr = curr.children[idx];\n        }\n        curr.isEnd = true;\n    }\n    static boolean search(String word) {\n        Node curr = root;\n        for (char c : word.toCharArray()) {\n            int idx = c - \'a\';\n            if (curr.children[idx] == null) return false;\n            curr = curr.children[idx];\n        }\n        return curr.isEnd;\n    }\n    public static void main(String[] args) {\n        String[] words = {"apple","app","apply","apt"};\n        for (String w : words) insert(w);\n        System.out.println("Search apple: " + search("apple"));\n        System.out.println("Search app:   " + search("app"));\n        System.out.println("Search ap:    " + search("ap"));\n    }\n}',
'Trie tree structure hai jahan har node ek character represent karta hai. Words ko efficiently insert aur search kar sakte hain.',
'Search apple: true\nSearch app:   true\nSearch ap:    false', 14, 'ADVANCED', 'O(L)', 'O(ALPHABET_SIZE × L × N)', 6),

('Topological Sort',
'Directed acyclic graph ka topological order nikalo',
'import java.util.*;\npublic class TopologicalSort {\n    static int V = 6;\n    static List<List<Integer>> adj = new ArrayList<>();\n    static void dfs(int v, boolean[] visited, Stack<Integer> stack) {\n        visited[v] = true;\n        for (int u : adj.get(v))\n            if (!visited[u]) dfs(u, visited, stack);\n        stack.push(v);\n    }\n    public static void main(String[] args) {\n        for (int i = 0; i < V; i++) adj.add(new ArrayList<>());\n        adj.get(5).add(2); adj.get(5).add(0);\n        adj.get(4).add(0); adj.get(4).add(1);\n        adj.get(2).add(3); adj.get(3).add(1);\n        Stack<Integer> stack = new Stack<>();\n        boolean[] visited = new boolean[V];\n        for (int i = 0; i < V; i++)\n            if (!visited[i]) dfs(i, visited, stack);\n        System.out.print("Topological Order: ");\n        while (!stack.isEmpty()) System.out.print(stack.pop() + " ");\n    }\n}',
'Topological sort DFS use karta hai. Node process hone ke baad stack mein push karo. Stack ka reverse topological order deta hai.',
'Topological Order: 5 4 2 3 1 0', 8, 'ADVANCED', 'O(V+E)', 'O(V)', 5),

('Kruskal Minimum Spanning Tree',
'Kruskal algorithm se MST nikalo',
'import java.util.*;\npublic class Kruskal {\n    static int[] parent, rank;\n    static int find(int x) { if (parent[x] != x) parent[x] = find(parent[x]); return parent[x]; }\n    static void union(int x, int y) {\n        int px = find(x), py = find(y);\n        if (rank[px] < rank[py]) parent[px] = py;\n        else if (rank[px] > rank[py]) parent[py] = px;\n        else { parent[py] = px; rank[px]++; }\n    }\n    public static void main(String[] args) {\n        int V = 4;\n        int[][] edges = {{0,1,10},{0,2,6},{0,3,5},{1,3,15},{2,3,4}};\n        Arrays.sort(edges, (a,b) -> a[2]-b[2]);\n        parent = new int[V]; rank = new int[V];\n        for (int i = 0; i < V; i++) parent[i] = i;\n        int mstCost = 0;\n        System.out.println("MST Edges:");\n        for (int[] e : edges) {\n            if (find(e[0]) != find(e[1])) {\n                union(e[0], e[1]);\n                System.out.println(e[0] + " - " + e[1] + " : " + e[2]);\n                mstCost += e[2];\n            }\n        }\n        System.out.println("Total MST Cost: " + mstCost);\n    }\n}',
'Kruskal: edges ko weight se sort karo. Har edge add karo agar cycle nahi banti (Union-Find se check karo).',
'MST Edges:\n2 - 3 : 4\n0 - 3 : 5\n0 - 1 : 10\nTotal MST Cost: 19', 8, 'ADVANCED', 'O(E log E)', 'O(V)', 6),

('Segment Tree - Range Sum Query',
'Segment tree se range sum query karo',
'public class SegmentTree {\n    static int[] tree;\n    static void build(int[] arr, int node, int start, int end) {\n        if (start == end) { tree[node] = arr[start]; return; }\n        int mid = (start + end) / 2;\n        build(arr, 2*node, start, mid);\n        build(arr, 2*node+1, mid+1, end);\n        tree[node] = tree[2*node] + tree[2*node+1];\n    }\n    static int query(int node, int start, int end, int l, int r) {\n        if (r < start || end < l) return 0;\n        if (l <= start && end <= r) return tree[node];\n        int mid = (start + end) / 2;\n        return query(2*node, start, mid, l, r) + query(2*node+1, mid+1, end, l, r);\n    }\n    public static void main(String[] args) {\n        int[] arr = {1, 3, 5, 7, 9, 11};\n        int n = arr.length;\n        tree = new int[4 * n];\n        build(arr, 1, 0, n-1);\n        System.out.println("Sum(1,3) = " + query(1, 0, n-1, 1, 3));\n        System.out.println("Sum(2,5) = " + query(1, 0, n-1, 2, 5));\n    }\n}',
'Segment tree range queries O(log n) mein karta hai. Build O(n), Query O(log n). Competitive programming mein bahut use hota hai.',
'Sum(1,3) = 15\nSum(2,5) = 32', 7, 'ADVANCED', 'O(log n)', 'O(n)', 8),

('Floyd Warshall All Pairs Shortest Path',
'Sabhi pairs ke beech shortest path nikalo',
'public class FloydWarshall {\n    static final int INF = 99999;\n    public static void main(String[] args) {\n        int V = 4;\n        int[][] dist = {\n            {0,   5,  INF, 10},\n            {INF, 0,   3, INF},\n            {INF, INF, 0,   1},\n            {INF, INF, INF, 0}\n        };\n        for (int k = 0; k < V; k++)\n            for (int i = 0; i < V; i++)\n                for (int j = 0; j < V; j++)\n                    if (dist[i][k] + dist[k][j] < dist[i][j])\n                        dist[i][j] = dist[i][k] + dist[k][j];\n        System.out.println("All Pairs Shortest Paths:");\n        for (int[] row : dist) {\n            for (int x : row) System.out.printf("%6s", x == INF ? "INF" : x);\n            System.out.println();\n        }\n    }\n}',
'Floyd Warshall O(V^3) mein sabhi pairs ke shortest paths nikalata hai. Intermediate vertex k ko consider karta hai.',
'All Pairs Shortest Paths:\n  0   5   8   9\nINF   0   3   4\nINF INF   0   1\nINF INF INF   0', 8, 'ADVANCED', 'O(V³)', 'O(V²)', 7),

('Rabin Karp String Matching',
'Rolling hash se string pattern matching karo',
'public class RabinKarp {\n    static final int d = 256, q = 101;\n    static void search(String text, String pattern) {\n        int n = text.length(), m = pattern.length();\n        int h = 1, pHash = 0, tHash = 0;\n        for (int i = 0; i < m-1; i++) h = (h * d) % q;\n        for (int i = 0; i < m; i++) {\n            pHash = (d * pHash + pattern.charAt(i)) % q;\n            tHash = (d * tHash + text.charAt(i)) % q;\n        }\n        for (int i = 0; i <= n-m; i++) {\n            if (pHash == tHash) {\n                if (text.substring(i, i+m).equals(pattern))\n                    System.out.println("Pattern found at index: " + i);\n            }\n            if (i < n-m) {\n                tHash = (d*(tHash - text.charAt(i)*h) + text.charAt(i+m)) % q;\n                if (tHash < 0) tHash += q;\n            }\n        }\n    }\n    public static void main(String[] args) {\n        search("GEEKS FOR GEEKS", "GEEK");\n    }\n}',
'Rabin-Karp rolling hash use karta hai. Pattern ka hash calculate karo, phir text window ka hash slide karo.',
'Pattern found at index: 0\nPattern found at index: 10', 8, 'ADVANCED', 'O(n+m)', 'O(1)', 8);

-- ============================================================
-- VERIFY: Total programs count check karo
-- ============================================================
SELECT COUNT(*) AS total_programs FROM programs;
SELECT difficulty_level, COUNT(*) AS count FROM programs GROUP BY difficulty_level;
