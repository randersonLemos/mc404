class Registers:
    dic = {}
    dic['zero'] = 'ok'
    dic['ra']   = 'ok'
    dic['sp']   = 'ok'
    dic['gp']   = 'ok'
    dic['tp']   = 'ok'
    dic['t0']   = 'ok'
    dic['t1']   = 'ok'
    dic['t2']   = 'ok'
    dic['s0']   = 'ok'
    dic['fp']   = 'ok'
    dic['s1']   = 'ok'
    dic['a0']   = 'ok'
    dic['a1']   = 'ok'
    dic['a2']   = 'ok'
    dic['a3']   = 'ok'
    dic['a4']   = 'ok'
    dic['a5']   = 'ok'
    dic['a6']   = 'ok'
    dic['a7']   = 'ok'
    dic['s2']   = 'ok'
    dic['s3']   = 'ok'
    dic['s4']   = 'ok'
    dic['s5']   = 'ok'
    dic['s6']   = 'ok'
    dic['s7']   = 'ok'
    dic['s8']   = 'ok'
    dic['s9']   = 'ok'
    dic['s10']  = 'ok'
    dic['s11']  = 'ok'
    dic['t3']   = 'ok'
    dic['t4']   = 'ok'
    dic['t5']   = 'ok'
    dic['t6']   = 'ok'
    

    @classmethod
    def get(cls, re):
        if re in cls.dic:
            return cls.dic[re]
        return None

    @classmethod
    def get_num(cls, re):
        if re.isnumeric():
            return int(re)
        return None



class None2:
    def __call__(self, *args, **kwargs):
        return None


class Addi:
    def __init__(self):
        self.rd = None; self.rs = None; self.im = None


    def __call__(self, rd, rs, im):
        if ( rd[-1] != ',') or ( rd[-1] != ',' ):
            return None

        rd = rd[:-1]
        rs = rs[:-1]

        _rd = rd; _rs = rs; _im = im

        rd = Registers.get(rd)
        rs = Registers.get(rs)
        im = Registers.get_num(im) 
        
        if rd:
            self.rd = _rd
            
        if rs:
            self.rs = _rs

        if im:
            self.im = _im

        if not (rd and rs and im):
            return None

        return (rd, rs, im)


    def __repr__(self):
        return 'addi {}, {}, {}'.format(self.rd, self.rs, self.im)


class Mnenomics:
    dic = {}
    dic['addi'] = Addi

    @classmethod
    def get(cls, pi):
        if pi in cls.dic:
            return cls.dic[pi]()
        return None2()


if __name__ == '__main__':
    while True:
        print("Informe instrução Assembly ou digite 'exit' para finalizar o programa.")
        cmd = input()

        if cmd == 'exit' : exit()

        cmd = cmd.strip().split(' ')

        print(cmd)

        if len( cmd ) == 4:
            a, b, c, d = cmd

            mnm = Mnenomics.get(a)
            pso = mnm( b, c, d )
            print('@@@@@@@@@')
            print( mnm )
            print( pso )

        else:
            print('Instrução fora da especificação.')



