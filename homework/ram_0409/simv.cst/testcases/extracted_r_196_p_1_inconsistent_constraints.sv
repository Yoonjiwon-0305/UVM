class c_196_1;
    int i = 195;
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

program p_196_1;
    c_196_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "00x001z111x0zx0z1z1xx101xzxxzxz0xzxzzzxxzzxzxzxzzzxzzzxxxzxxxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
