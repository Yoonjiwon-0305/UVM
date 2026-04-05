class weapon;
    string name;
    function new(string name);
        this.name = name;
    endfunction  //new()

    virtual function void shot();
        $display(" [%s] ... (소리 없음)", name);
    endfunction
endclass

class M16 extends weapon;

    function new(string name);
        super.new(name);
    endfunction

    virtual function void shot();
        $display(" [%s] 탕탕!", name);
    endfunction
endclass

class K2 extends weapon;

    function new(string name);
        super.new(name);
    endfunction

    virtual function void shot();
        $display(" [%s] 빵빵", name);
    endfunction
endclass

class AUG extends weapon;

    function new(string name);
        super.new(name);
    endfunction

    virtual function void shot();
        $display(" [%s] 삐~~!", name);
    endfunction
endclass

module tb_oop ();

    initial begin
        weapon BlackPink = new("없음");
        weapon hand = new("주먹");
        M16    m16 = new("M16");
        K2     k2 = new("K2");
        AUG    aug = new("AUG");

        $display("=== verify demo ===");
        BlackPink.shot();
        $display("=== 무기 M16으로 변경 ===");
        BlackPink = m16;
        BlackPink.shot();
        $display("=== 무기 K2으로 변경 ===");
        BlackPink = k2;
        BlackPink.shot();
        $display("=== 무기 AUG으로 변경 ===");
        BlackPink = aug;
        BlackPink.shot();
    end

endmodule
