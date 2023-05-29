class Registers:
    dic = {}
    dic['zero'] = '{:0>5}'.format(bin(0)[2:])
    dic['ra']   = '{:0>5}'.format(bin(1)[2:])
    dic['sp']   = '{:0>5}'.format(bin(2)[2:])
    dic['gp']   = '{:0>5}'.format(bin(3)[2:])
    dic['tp']   = '{:0>5}'.format(bin(4)[2:])
    dic['t0']   = '{:0>5}'.format(bin(5)[2:])
    dic['t1']   = '{:0>5}'.format(bin(6)[2:])
    dic['t2']   = '{:0>5}'.format(bin(7)[2:])
    dic['s0']   = '{:0>5}'.format(bin(8)[2:])
    dic['fp']   = '{:0>5}'.format(bin(8)[2:])
    dic['s1']   = '{:0>5}'.format(bin(9)[2:])
    dic['a0']   = '{:0>5}'.format(bin(10)[2:])
    dic['a1']   = '{:0>5}'.format(bin(11)[2:])
    dic['a2']   = '{:0>5}'.format(bin(12)[2:])
    dic['a3']   = '{:0>5}'.format(bin(13)[2:])
    dic['a4']   = '{:0>5}'.format(bin(14)[2:])
    dic['a5']   = '{:0>5}'.format(bin(15)[2:])
    dic['a6']   = '{:0>5}'.format(bin(16)[2:])
    dic['a7']   = '{:0>5}'.format(bin(17)[2:])
    dic['s2']   = '{:0>5}'.format(bin(18)[2:])
    dic['s3']   = '{:0>5}'.format(bin(19)[2:])
    dic['s4']   = '{:0>5}'.format(bin(20)[2:])
    dic['s5']   = '{:0>5}'.format(bin(21)[2:])
    dic['s6']   = '{:0>5}'.format(bin(22)[2:])
    dic['s7']   = '{:0>5}'.format(bin(23)[2:])
    dic['s8']   = '{:0>5}'.format(bin(24)[2:])
    dic['s9']   = '{:0>5}'.format(bin(25)[2:])
    dic['s10']  = '{:0>5}'.format(bin(26)[2:])
    dic['s11']  = '{:0>5}'.format(bin(27)[2:])
    dic['t3']   = '{:0>5}'.format(bin(28)[2:])
    dic['t4']   = '{:0>5}'.format(bin(29)[2:])
    dic['t5']   = '{:0>5}'.format(bin(30)[2:])
    dic['t6']   = '{:0>5}'.format(bin(31)[2:])
    
    @classmethod
    def get(cls, re):
        if re in cls.dic:
            return cls.dic[re]
        return None

    @classmethod
    def get_num(cls, re):
        if re.isnumeric():
            return '{:0>12}'.format(bin(int(re))[2:])
            #return int(re)
        return None


class None2:
    def __call__(self, *args, **kwargs):
        return None


class FormatIType:
    def __init__(self):
        self.imm = None
        self.rs1 = None
        self.funct3 = None
        self.rd = None
        self.opcode = None

        self._rs1 = None
        self._rd  = None
        self._imm = None


    def __call__(self, _rd, _rs1, _imm):
        if ( _rd[-1] != ',') or ( _rs1[-1] != ',' ):
            return False

        _rd = _rd[:-1]; _rs1 = _rs1[:-1]

        rd  = Registers.get(_rd)
        rs1 = Registers.get(_rs1)
        imm = Registers.get_num(_imm) 
        
        if rd:
            self.rd  = rd
            self._rd = _rd
            
        if rs1:
            self.rs1  = rs1
            self._rs1 = _rs1


        if imm:
            self.imm = imm
            self._imm = _imm

        if not (rd and rs1 and imm):
            return False

        return True


    def bin(self):
        return  self.imm + self.rs1 +  self.funct3 + self.rd + self.opcode


    def hex(self):
        return '0x{:0>8}'.format( hex( int( '0b'+self.bin(), 2 ) )[2:] )


    def __repr__(self):
        return self.hex()


class Addi(FormatIType):
    def __init__(self):
        super().__init__()
        self.funct3 = '000'
        self.opcode = '0010011'


    def info(self):
        stg = ''
        stg += 'addi {}, {}, {}\n'.format(self._rd, self._rs1, self._imm)
        stg += '{}|{}|{}|{}|{} ({})\n'.format(self.imm, self.rs1, self.funct3, self.rd, self.opcode, len( self.bin() ))
        stg += self.hex() 
        return stg




class Mnenomics:
    dic = {}
    dic['addi'] = Addi

    @classmethod
    def get(cls, pi):
        if pi in cls.dic:
            return cls.dic[pi]()
        return None2()


if __name__ == '__main__':
    INPUT = [
      'addi zero, zero, 0'
    , 'addi t0, zero, 4'
    , 'exit'
    ]

    ITE_INPUT = iter(INPUT)

    while True:
        print("Informe instrução Assembly ou digite 'exit' para finalizar o programa.")

        #cmd = input()
        cmd = next( ITE_INPUT )
        
        print('+++')
        print( 'cmd:', cmd )
        
        if cmd == 'exit':
            print('+++')
            exit()

        cmd = cmd.strip().split(' ')

        if len( cmd ) == 4:
            a, b, c, d = cmd

            mnm = Mnenomics.get(a)
            print('---')
            if mnm( b, c, d ):
                print(mnm) 
                print(mnm.info()) 
            else:
                print('Instrução fora da especificação.')
            print('---')

        else:
            print('Instrução fora da especificação.')

        print('+++')



