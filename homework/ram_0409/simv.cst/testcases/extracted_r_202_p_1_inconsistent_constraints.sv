class c_202_1;
    int i = 201;
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

program p_202_1;
    c_202_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1xz0xzx0xxxx0zz1xx0100011z0zxx01xxxxxxxzzxzxzxzzzzzxxzzxzzzxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
