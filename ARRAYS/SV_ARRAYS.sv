module test;
 int arr[5];
initial begin
arr = '{1,2,3,4,5};

foreach (arr[i])
$display("arry[%0d] = %0d",i,arr[i]);
end

endmodule
