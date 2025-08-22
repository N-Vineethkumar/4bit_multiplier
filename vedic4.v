module vedic2(
input [1:0]a,b, output [3:0]s
);
    wire c1,c2,c3,c4;
    assign s[0] = a[0]&b[0];
    assign c1=b[0]&a[1];
    assign c2=b[1]&a[0];
    ha ha1(c1,c2,s[1],c3);
    assign c4 = a[1]&b[1];
    ha ha2(c3,c4,s[2],s[3]);
endmodule

module ha(
input a,b, output s,c
);
assign s = a^b;
assign c = a&b;
endmodule
module vedic4(
input [3:0]a,b, output [7:0]s
);
wire [3:0]temp,t2,t3,t4,t5,t6;
wire [5:0]ao1,ao2,ao3,ao4;
vedic2 ad1(a[1:0],b[1:0],temp[3:0]);
vedic2 ad2(a[1:0],b[3:2],t2[3:0]);
vedic2 ad3(a[3:2],b[1:0],t3[3:0]);
vedic2 ad4(a[3:2],b[3:2],t4[3:0]);
assign s[1:0]=temp[1:0];
assign t6={2'b0,temp[3:2]};
add4 a1(t6,t2,t5);
assign ao1={2'b0,t5};
assign ao2={2'b0,t3};
add6 a2(ao1,ao2,ao3);
assign ao4={t4,2'b0};
add6 a3(ao3,ao4,s[7:2]);
endmodule
module add4(
input[3:0]a,b,output [3:0]s
);
assign s=a+b;
endmodule
module add6(
input[5:0]a,b,output [5:0]s
);
assign s=a+b;
endmodule
