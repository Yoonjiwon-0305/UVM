class c_90_1;
    int i = 89;
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

program p_90_1;
    c_90_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "011z1x010xxx00zzx0x0zxx1xz00z1x0xzxxxxzxxxzzzxzxxxzzzzxzzxzzxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
