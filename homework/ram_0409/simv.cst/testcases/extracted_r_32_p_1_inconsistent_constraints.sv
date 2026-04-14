class c_32_1;
    int i = 31;
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

program p_32_1;
    c_32_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "111z1z00z1011x0zxzzzx0xx01x0z0x0zxxxzxxxzzxxxzxxxxxzzzzzxxxzzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
