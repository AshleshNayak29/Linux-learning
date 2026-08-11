module test;
int a[5];

initial begin
a = '{1,2,3,4,5};

foreach (a[i]) begin
$display("a[%0d]=%0d",i,a[i]);
end
endmodule
