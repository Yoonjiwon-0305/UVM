class c_146_1;
    int i = 145;
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

program p_146_1;
    c_146_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "10x0x0000100xz0zxx1010zz0x1z0x10zzzxzzzzzxxxxzzxxzxzzxxzzxxxzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
