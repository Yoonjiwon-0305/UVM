class c_74_1;
    int i = 73;
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

program p_74_1;
    c_74_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "01x1zxzxxz1xx0zxx1zx1xxx001zzzx1xxxxxzzxxxzzxxxxzzzxzxxzzxxzxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
