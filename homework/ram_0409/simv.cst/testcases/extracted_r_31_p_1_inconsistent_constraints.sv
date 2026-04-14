class c_31_1;
    int i = 30;
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

program p_31_1;
    c_31_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xzz0001zx01xx00zzx1z0x101x010zx0xzzzzxzxzzzzzzxzzxxzxzxzxxxxxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
