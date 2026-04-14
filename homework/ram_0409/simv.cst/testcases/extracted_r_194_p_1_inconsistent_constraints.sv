class c_194_1;
    int i = 193;
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

program p_194_1;
    c_194_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xxzx1x0zx000100xxx11xzz1z1z1zx11xxzzzzxzzxzzzxxxzzxzxzzzxxxzzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
