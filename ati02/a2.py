### 103897
### Randerson Araujo de Lemos


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
    def get_num(cls, re, qty=12):
        if re.isnumeric() or re.lstrip('-').isnumeric():
            if ( int(re) >= 0 ) and ( int(re) < 2048 ):
                if qty == 12:
                    return '{:0>12}'.format(bin(int(re))[2:])
                else:
                    return '{:0>13}'.format(bin(int(re))[2:])

            if ( int(re) >= -2048 ) and ( int(re) < 0 ):
                num = -1*int( re )
                if qty == 12:
                    numBin =  '{:0>12}'.format(bin(int(re))[3:])
                else:
                    numBin =  '{:0>13}'.format(bin(int(re))[3:])
                numBin = numBin[::-1]
                lst = []
                change = False
                for en, el in enumerate( numBin ):
                    if not change:
                        lst.append(el)
                        if el == '1':
                            change = True
                    else:
                        lst.append( str( int( not( el == 1 ) ) ) )
                numBin = ''.join(lst)[::-1]
                return numBin
        return None


    @classmethod
    def get_register(cls, binn):
        for key in cls.dic:
            if cls.dic[key] == binn:
                return key
        return None


class None2:
    def __call__(self, *args, **kwargs):
        return None


class FormatRType:
    def __init__(self):
        self.rs2    = None
        self.rs1    = None
        self.funct3 = None
        self.rd     = None
        self.opcode = None

        self._rd  = None
        self._rs1 = None
        self._rs2 = None


    def __call__(self, _rd, _rs1, _rs2):
        rd  = Registers.get(_rd )
        rs1 = Registers.get(_rs1)
        rs2 = Registers.get(_rs2) 

        if rd:
            self.rd  = rd
            self._rd = _rd
            
        if rs1:
            self.rs1  = rs1
            self._rs1 = _rs1

        if rs2:
            self.rs2  = rs2
            self._rs2 = _rs2

        if not (rd and rs1 and rs2):
            return False

        return True


    def bin(self, lefts='0000000'):
        return  lefts + self.rs2 + self.rs1 + self.funct3 + self.rd + self.opcode


    def hex(self):
        return '0x{:0>8}'.format( hex( int( '0b'+self.bin(), 2 ) )[2:] ).upper()


    def __repr__(self):
        return self.hex()


class FormatIType:
    def __init__(self):
        self.imm    = None
        self.rs1    = None
        self.funct3 = None
        self.rd     = None
        self.opcode = None

        self._rs1 = None
        self._rd  = None
        self._imm = None


    def __call__(self, _rd, _rs1, _imm):
        rd  = Registers.get(_rd )
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
        return '0x{:0>8}'.format( hex( int( '0b'+self.bin(), 2 ) )[2:] ).upper()


    def __repr__(self):
        return self.hex()


class FormatLoadType(FormatIType):
    def __init__(self):
        super().__init__()

    def __call__(self, rd, rs):
        lst = [ el for el in rs.replace('(', ' ').replace(')', ' ').split(' ') if el ]
        if len(lst) == 2:
            imm, rs1 = lst
            return super().__call__( rd, rs1, imm )
        return False


class FormatSaveType(FormatRType):
    def __init__(self):
        super().__init__()
        self.lefts = '0000000'


    def __call__(self, rs, rd):
        rs2 = rs
        lst = [ el for el in rd.replace('(', ' ').replace(')', ' ').split(' ') if el ]
        if len(lst) == 2:
            imm , rs1 = lst
            immBin = Registers.get_num( imm )
            lefts = immBin[:7]
            rdBin = immBin[7:]

            self.lefts = lefts
            rd = Registers.get_register( rdBin )

            return super().__call__( rd, rs1, rs2 )
        return False


    def bin(self):
        return super().bin(self.lefts)


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


class Slli(FormatIType):
    def __init__(self):
        super().__init__()
        self.funct3 = '001'
        self.opcode = '0010011'


    def info(self):
        stg = ''
        stg += 'slli {}, {}, {}\n'.format(self._rd, self._rs1, self._imm)
        stg += '{}|{}|{}|{}|{} ({})\n'.format(self.imm, self.rs1, self.funct3, self.rd, self.opcode, len( self.bin() ))
        stg += self.hex() 
        return stg


class Xor(FormatRType):
    def __init__(self):
        super().__init__()
        self.funct3 = '100'
        self.opcode = '0110011'


    def info(self):
        stg = ''
        stg += 'xor {}, {}, {}\n'.format(self._rd, self._rs1, self._rs2)
        stg += '0000000{}|{}|{}|{}|{} ({})\n'.format(self.rs2, self.rs1, self.funct3, self.rd, self.opcode, len( self.bin() ))
        stg += self.hex() 
        return stg


class Mul(FormatRType):
    def __init__(self):
        super().__init__()
        self.funct3 = '000'
        self.opcode = '0110011'


    def bin(self):
        return  '0000001' + self.rs2 + self.rs1 + self.funct3 + self.rd + self.opcode


    def info(self):
        stg = ''
        stg += 'mul {}, {}, {}\n'.format(self._rd, self._rs1, self._rs2)
        stg += '0000000{}|{}|{}|{}|{} ({})\n'.format(self.rs2, self.rs1, self.funct3, self.rd, self.opcode, len( self.bin() ))
        stg += self.hex() 
        return stg


class Lw(FormatLoadType):
    def __init__(self):
        super().__init__()
        self.funct3 = '010'
        self.opcode = '0000011'


    def info(self):
        stg = ''
        stg += 'lw {}, {}, {}\n'.format(self._rd, self._rs1, self._imm)
        stg += '{}|{}|{}|{}|{} ({})\n'.format(self.imm, self.rs1, self.funct3, self.rd, self.opcode, len( self.bin() ))
        stg += self.hex() 
        return stg


class Sw(FormatSaveType):
    def __init__(self):
        super().__init__()
        self.funct3 = '010'
        self.opcode = '0100011'


    def info(self):
        stg = ''
        stg += 'sw {}, {}, {}\n'.format(self._rd, self._rs1, self._rs2)
        stg += '0000000{}|{}|{}|{}|{} ({})\n'.format(self.rs2, self.rs1, self.funct3, self.rd, self.opcode, len( self.bin() ))
        stg += self.hex() 
        return stg


class Call(FormatIType):
    def __init__(self):
        super().__init__()
        self.funct3 = '000'
        self.opcode = '1100111'


    def __call__(self, label ):
        if not label.isnumeric():
            return False
        offset = int(label) - 1000
        return super().__call__('ra', 't1',  str(offset))


    def info(self):
        stg = ''
        stg += 'call {}, {}, {}\n'.format(self._rd, self._rs1, self._imm)
        stg += '{}|{}|{}|{}|{} ({})\n'.format(self.imm, self.rs1, self.funct3, self.rd, self.opcode, len( self.bin() ))
        stg += self.hex() 
        return stg


class Ret(FormatIType):
    def __init__(self):
        super().__init__()
        self.funct3 = '000'
        self.opcode = '1100111'


    def __call__( self ):
        return super().__call__('zero', 'ra',  '0')


    def info(self):
        stg = ''
        stg += 'ret {}, {}, {}\n'.format(self._rd, self._rs1, self._imm)
        stg += '{}|{}|{}|{}|{} ({})\n'.format(self.imm, self.rs1, self.funct3, self.rd, self.opcode, len( self.bin() ))
        stg += self.hex() 
        return stg



class Beq(FormatRType):
    def __init__(self):
        super().__init__()
        self.lefts = '0000000'
        self.funct3 = '000'
        self.opcode = '1100011'


    def __call__(self, rs1, rs2, imm):
        immBin = Registers.get_num( imm, 13 )[:-1]
        lefts = immBin[0] + immBin[2:8]
        rdBin = immBin[8:12] + immBin[1]
        rd = Registers.get_register( rdBin )

        self.lefts = lefts
        rd = Registers.get_register( rdBin )

        return super().__call__( rd, rs1, rs2 )


    def info(self):
        stg = ''
        stg += 'beq {}, {}, {}\n'.format(self._rd, self._rs1, self._rs2)
        stg += '0000000{}|{}|{}|{}|{} ({})\n'.format(self.rs2, self.rs1, self.funct3, self.rd, self.opcode, len( self.bin() ))
        stg += self.hex() 
        return stg




    def bin(self):
        return super().bin(self.lefts)


class Mnenomics:
    dic = {}
    dic['addi'] = Addi
    dic['slli'] = Slli
    dic['xor']  = Xor
    dic['mul']  = Mul
    dic['lw']   = Lw
    dic['sw']   = Sw
    dic['call'] = Call
    dic['ret']  = Ret
    dic['beq']  = Beq


    @classmethod
    def get(cls, pi):
        if pi in cls.dic:
            return cls.dic[pi]()
        return None2()


if __name__ == '__main__':
    # TESTED INSTRUCTIONS 
    #INPUT = [
    #  'addi t0, zero, 4'
    #, 'slli t1, t0, 10'
    #, 'xor  t2, t0, t0'
    #, 'mul  s4 s3 t0'
    #, 'lw a0, 12(s0)'
    #, 'sw a2,  5(t0)'
    #, 'call 1016'
    #, 'call 1500'
    #, 'ret'
    #, 'beq s0, s1, -8'
    #, 'exit'
    #]

    #ITE_INPUT = iter(INPUT)

    while True:
        print("Informe instrução Assembly ou digite 'exit' para finalizar o programa.")

        cmd = input()
        #cmd = next( ITE_INPUT )
        
        if cmd == 'exit':
            print('Bye bye')
            exit()

        cmd = cmd.strip().replace(',', '').split(' ')
        cmd = [el  for el in cmd if el]

        if len( cmd ) == 1:
            a = cmd[0]
            mnm = Mnenomics.get(a)
            if mnm():
                print(mnm)
            else:
                print('Instrução fora da especificação.')

        if len( cmd ) == 2:
            a, b = cmd
            mnm = Mnenomics.get(a)
            if mnm( b ):
                print(mnm)
            else:
                print('Instrução fora da especificação.')

        elif len( cmd ) == 3:
            a, b, c = cmd
            mnm = Mnenomics.get(a)
            if mnm( b, c ):
                print(mnm)
            else:
                print('Instrução fora da especificação.')


        elif len( cmd ) == 4:
            a, b, c, d = cmd

            mnm = Mnenomics.get(a)
            if mnm( b, c, d ):
                print(mnm) 
            else:
                print('Instrução fora da especificação.')

        else:
            print('Instrução fora da especificação.')


        print('---')



