class c_130_1;
    int i = 129;
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

program p_130_1;
    c_130_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "00x1xxxx1xzz11zx111z111x0101x0zzxxxzzxxzzxzzxxxxzxzxxzzzzzzzxxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
