class c_62_1;
    int i = 61;
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

program p_62_1;
    c_62_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1zz1z00110z110xzz11z1zz1x00010zzxzxzzzzxxxzzzxzxxxzzxzxzzxxzzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
