public class demo{
     static int add(int a, int b) {
        return a + b;
    }

    // Method with two doubles
    static double add(double a, double b) {
        return a + b;
    }

    // Method with three integers
    static int add(int a, int b, int c) {
        return a + b + c;
    }
       public static void main(String[] args) {

        // Calling add method with two integers
        int sum1 = add(10, 20);

        // Calling add method with two doubles
        double sum2 = add(5.5, 4.5);

        // Calling add method with three integers
        int sum3 = add(1, 2, 3);

        // Displaying results
        System.out.println("Sum of two integers: " + sum1);
        System.out.println("Sum of two doubles: " + sum2);
        System.out.println("Sum of three integers: " + sum3);
    }
}
