class c_95_1;
    int i = 94;
    rand bit[7:0] addr; // rand_mode = ON 

    constraint r_addr_this    // (constraint_mode = ON) (./tb/ram_seq_item.sv:14)
    {
       (addr inside {[8'h0:8'hf]});
    }
    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (./tb/ram_sequence.sv:102)
    {
       (addr == i);
    }
endclass

program p_95_1;
    c_95_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1001xxxzxz011x0xzx1z110zx0001000xzxzzxzzzzxxxxxzxzzzxzxzxxxxxxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
