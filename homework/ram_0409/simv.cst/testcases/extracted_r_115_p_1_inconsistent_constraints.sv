class c_115_1;
    int i = 114;
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

program p_115_1;
    c_115_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0z01x10z0xx1x10x1110z11zz01zzx0xxxzzzxxzzzzxxzzxxxxxzxzzzzzzzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
