class c_68_1;
    int i = 67;
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

program p_68_1;
    c_68_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0z1zx101z1xzz1x1zzz100x100xzzx1zxzzzzzxxzxzxxzxxxxzxzzzzzxxxxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
