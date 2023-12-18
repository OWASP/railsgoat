public class SonarQubeTest {

    // Unused field
    private String unusedField;

    // Unused method parameter
    public void unusedMethodParameter(int unusedParameter) {
        System.out.println("This method has an unused parameter.");
    }

    // Null pointer dereference
    public void nullPointerDereference() {
        String nullString = null;
        System.out.println(nullString.length());
    }

    // Division by zero
    public void divisionByZero() {
        int numerator = 10;
        int denominator = 0;
        int result = numerator / denominator;
        System.out.println("Result: " + result);
    }

    // Infinite loop
    public void infiniteLoop() {
        while (true) {
            System.out.println("This is an infinite loop.");
        }
    }

    public static void main(String[] args) {
        SonarQubeTest test = new SonarQubeTest();
        test.unusedMethodParameter(42);
        test.nullPointerDereference();
        test.divisionByZero();
        test.infiniteLoop();
    }
}
