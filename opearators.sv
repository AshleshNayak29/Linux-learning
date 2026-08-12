module operators;

  int a = 10;
  int b = 3;
  int x;
  bit p = 1;
  bit q = 0;

  initial begin

    // =========================================================
    // 1. ARITHMETIC OPERATORS
    // =========================================================

    $display("===== ARITHMETIC OPERATORS =====");

    $display("a + b = %0d", a + b);
    $display("a - b = %0d", a - b);
    $display("a * b = %0d", a * b);
    $display("a / b = %0d", a / b);
    $display("a %% b = %0d", a % b);

    $display("a ** b = %0d", a ** b);


    // =========================================================
    // 2. RELATIONAL OPERATORS
    // =========================================================

    $display("\n===== RELATIONAL OPERATORS =====");

    $display("a < b  = %0d", a < b);
    $display("a > b  = %0d", a > b);
    $display("a <= b = %0d", a <= b);
    $display("a >= b = %0d", a >= b);


    // =========================================================
    // 3. EQUALITY OPERATORS
    // =========================================================

    $display("\n===== EQUALITY OPERATORS =====");

    $display("a == b = %0d", a == b);
    $display("a != b = %0d", a != b);

    $display("a === b = %0d", a === b);
    $display("a !== b = %0d", a !== b);


    // =========================================================
    // 4. LOGICAL OPERATORS
    // =========================================================

    $display("\n===== LOGICAL OPERATORS =====");

    $display("p && q = %0d", p && q);
    $display("p || q = %0d", p || q);
    $display("!p     = %0d", !p);


    // =========================================================
    // 5. BITWISE OPERATORS
    // =========================================================

    $display("\n===== BITWISE OPERATORS =====");

    $display("p & q = %0d", p & q);
    $display("p | q = %0d", p | q);
    $display("p ^ q = %0d", p ^ q);
    $display("p ~^ q = %0d", p ~^ q);
    $display("p ^~ q = %0d", p ^~ q);
    $display("~p = %0d", ~p);


    // =========================================================
    // 6. SHIFT OPERATORS
    // =========================================================

    $display("\n===== SHIFT OPERATORS =====");

    x = 8;

    $display("x << 1  = %0d", x << 1);
    $display("x >> 1  = %0d", x >> 1);
    $display("x <<< 1 = %0d", x <<< 1);
    $display("x >>> 1 = %0d", x >>> 1);


    // =========================================================
    // 7. ASSIGNMENT OPERATORS
    // =========================================================

    $display("\n===== ASSIGNMENT OPERATORS =====");

    x = 10;
    $display("x = 10  -> %0d", x);

    x += 5;
    $display("x += 5  -> %0d", x);

    x -= 3;
    $display("x -= 3  -> %0d", x);

    x *= 2;
    $display("x *= 2  -> %0d", x);

    x /= 4;
    $display("x /= 4  -> %0d", x);

    x %= 3;
    $display("x %%= 3 -> %0d", x);


    // =========================================================
    // 8. INCREMENT / DECREMENT OPERATORS
    // =========================================================

    $display("\n===== INCREMENT / DECREMENT =====");

    x = 5;

    $display("x++ = %0d", x++);
    $display("After x++ = %0d", x);

    $display("++x = %0d", ++x);

    $display("x-- = %0d", x--);
    $display("After x-- = %0d", x);

    $display("--x = %0d", --x);


    // =========================================================
    // 9. UNARY OPERATORS
    // =========================================================

    $display("\n===== UNARY OPERATORS =====");

    x = 5;

    $display("+x = %0d", +x);
    $display("-x = %0d", -x);
    $display("~x = %0d", ~x);


    // =========================================================
    // 10. CONDITIONAL / TERNARY OPERATOR
    // =========================================================

    $display("\n===== CONDITIONAL OPERATOR =====");

    x = (a > b) ? a : b;

    $display("Larger value = %0d", x);


    // =========================================================
    // 11. CONCATENATION OPERATOR
    // =========================================================

    $display("\n===== CONCATENATION =====");

    bit [3:0] A = 4'b1010;
    bit [3:0] B = 4'b0101;
    bit [7:0] C;

    C = {A, B};

    $display("A = %b", A);
    $display("B = %b", B);
    $display("{A,B} = %b", C);


    // =========================================================
    // 12. REPETITION OPERATOR
    // =========================================================

    $display("\n===== REPETITION OPERATOR =====");

    bit [3:0] D;

    D = {4{1'b1}};

    $display("{4{1'b1}} = %b", D);


    // =========================================================
    // 13. INDEXING
    // =========================================================

    $display("\n===== INDEXING =====");

    $display("A[0] = %b", A[0]);
    $display("A[1] = %b", A[1]);
    $display("A[2] = %b", A[2]);
    $display("A[3] = %b", A[3]);


    // =========================================================
    // 14. PART SELECT
    // =========================================================

    $display("\n===== PART SELECT =====");

    $display("A[3:2] = %b", A[3:2]);
    $display("A[1:0] = %b", A[1:0]);


    // =========================================================
    // 15. INSIDE OPERATOR
    // =========================================================

    $display("\n===== INSIDE OPERATOR =====");

    x = 5;

    if (x inside {1, 3, 5, 7})
      $display("x is inside the set");

    else
      $display("x is NOT inside the set");


    // =========================================================
    // 16. SET MEMBERSHIP WITH RANGE
    // =========================================================

    x = 7;

    if (x inside {[1:10]})
      $display("x is between 1 and 10");


    // =========================================================
    // 17. IMPLICATION OPERATOR
    // =========================================================

    $display("\n===== IMPLICATION =====");

    // Used mainly in SystemVerilog Assertions

    // Example:
    // a |-> b
    // If a occurs, b must occur in the same/next specified
    // timing relationship.


    // =========================================================
    // 18. SVA OPERATORS
    // =========================================================

    // Examples:
    //
    // |->  Overlapped implication
    // |=>  Non-overlapped implication
    // ##   Delay
    // [*]  Consecutive repetition
    // [->] Goto repetition
    // [=]  Non-consecutive repetition

    $display("\n===== END =====");

  end

endmodule
