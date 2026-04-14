class c_212_1;
    int i = 211;
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

program p_212_1;
    c_212_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x10x1zz0100zz01xx1xx100z0x00zxzxxxxxzxxzxxxxzzzzzxxzzzxxxzzzzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
