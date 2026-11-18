package com.trustserve;

public class TrustServeTests {
    private static int passed=0, failed=0;
    public static void main(String[] args) {
        test("AC price estimate", () -> check(new PricingService().estimate("AC Servicing","Cooling") == 799));
        test("Replacement adds estimate amount", () -> check(new PricingService().estimate("AC Servicing","Part replacement") == 1649));
        test("Plumbing base estimate", () -> check(new PricingService().estimate("Plumbing","Leak") == 399));
        test("Service catalogue has at least 5 services", () -> check(new ServiceCatalog().getItems().size() >= 5));
        test("Booking can be created", () -> check(new BookingService().create("Asha","Plumbing","Ahmedabad","2026-11-20 10:00",399).getId().startsWith("TS-")));
        test("Booking rejects missing customer", () -> expectError(() -> new BookingService().create("","AC","Address","Tomorrow",799)));
        test("Booking rejects missing address", () -> expectError(() -> new BookingService().create("Asha","AC","","Tomorrow",799)));
        test("Booking rejects negative amount", () -> expectError(() -> new BookingService().create("Asha","AC","Address","Tomorrow",-1)));
        test("Review accepts 5 stars", () -> check(new ReviewService().validateRating(5)==5));
        test("Review rejects 0 stars", () -> expectError(() -> new ReviewService().validateRating(0)));
        test("Review rejects 6 stars", () -> expectError(() -> new ReviewService().validateRating(6)));
        test("Customer role override", () -> check(new Customer("Asha","a@b.com").getRoleLabel().equals("Customer")));
        test("Professional role override", () -> check(new Professional("Ravi","r@b.com","AC",4).getRoleLabel().equals("Verified Professional")));
        System.out.println("\nTEST SUMMARY: " + passed + " passed, " + failed + " failed.");
        if(failed>0) System.exit(1);
    }
    private static void test(String name,Runnable r){
        try{r.run();passed++;System.out.println("[PASS] "+name);}
        catch(Throwable t){failed++;System.out.println("[FAIL] "+name+" — "+t.getMessage());}
    }
    private static void check(boolean ok){if(!ok)throw new AssertionError("Condition was false");}
    private static void expectError(Runnable r){try{r.run();throw new AssertionError("Expected validation error");}catch(IllegalArgumentException expected){}}
}
