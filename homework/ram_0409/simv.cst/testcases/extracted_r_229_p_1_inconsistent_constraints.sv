class c_229_1;
    int i = 228;
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

program p_229_1;
    c_229_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x101x1100zx1z0xz0xzxz0z011x1zzxxxzzxzxxxzzxxzxxxxzxzzxxxxxzzxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
