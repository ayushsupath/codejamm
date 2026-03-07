// Sample Java Programs

const SAMPLE_PROGRAMS = {
    hello: {
        name: 'Hello World',
        code: `public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
        System.out.println("Welcome to CodeJamm!");
    }
}`
    },
    
    fibonacci: {
        name: 'Fibonacci Series',
        code: `public class Fibonacci {
    public static void main(String[] args) {
        int n = 10; // Number of terms
        int a = 0, b = 1;
        
        System.out.print("Fibonacci Series: " + a + " " + b);
        
        for (int i = 2; i < n; i++) {
            int next = a + b;
            System.out.print(" " + next);
            a = b;
            b = next;
        }
        System.out.println();
    }
}`
    },
    
    factorial: {
        name: 'Factorial',
        code: `public class Factorial {
    // Recursive method to calculate factorial
    public static int factorial(int n) {
        if (n == 0 || n == 1) {
            return 1;
        }
        return n * factorial(n - 1);
    }
    
    public static void main(String[] args) {
        int number = 5;
        int result = factorial(number);
        System.out.println("Factorial of " + number + " = " + result);
    }
}`
    },
    
    prime: {
        name: 'Prime Number Check',
        code: `public class PrimeCheck {
    public static boolean isPrime(int n) {
        if (n <= 1) {
            return false;
        }
        for (int i = 2; i <= Math.sqrt(n); i++) {
            if (n % i == 0) {
                return false;
            }
        }
        return true;
    }
    
    public static void main(String[] args) {
        int number = 17;
        if (isPrime(number)) {
            System.out.println(number + " is a prime number");
        } else {
            System.out.println(number + " is not a prime number");
        }
    }
}`
    },
    
    array: {
        name: 'Array Sum',
        code: `public class ArraySum {
    public static void main(String[] args) {
        int[] numbers = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
        int sum = 0;
        
        System.out.println("Array elements:");
        for (int num : numbers) {
            System.out.print(num + " ");
            sum += num;
        }
        
        System.out.println("\\nSum of array elements: " + sum);
        System.out.println("Average: " + (sum / (double) numbers.length));
    }
}`
    },
    
    palindrome: {
        name: 'Palindrome Check',
        code: `public class PalindromeCheck {
    public static boolean isPalindrome(String str) {
        str = str.toLowerCase().replaceAll("[^a-z0-9]", "");
        int left = 0;
        int right = str.length() - 1;
        
        while (left < right) {
            if (str.charAt(left) != str.charAt(right)) {
                return false;
            }
            left++;
            right--;
        }
        return true;
    }
    
    public static void main(String[] args) {
        String[] testStrings = {"radar", "hello", "madam", "racecar", "java"};
        
        for (String str : testStrings) {
            if (isPalindrome(str)) {
                System.out.println(str + " is a palindrome");
            } else {
                System.out.println(str + " is not a palindrome");
            }
        }
    }
}`
    }
};

// Export for use in other files
if (typeof module !== 'undefined' && module.exports) {
    module.exports = SAMPLE_PROGRAMS;
}
