import random
from myhdl import block, always_comb, instance, intbv, instances, Signal, delay, bin

random.seed()
randrange = random.randrange


@block
def decoder(din, dout):
    @always_comb
    def decoder_4to16():
        if din == 0:
            dout.next = 0b00000000000000001
        elif din == 1:
            dout.next = 0b00000000000000010
        elif din == 2:
            dout.next = 0b00000000000000100
        elif din == 3:
            dout.next = 0b00000000000001000
        elif din == 4:
            dout.next = 0b0000000000010000
        elif din == 5:
            dout.next = 0b0000000000100000
        elif din == 6:
            dout.next = 0b0000000001000000
        elif din == 7:
            dout.next = 0b0000000010000000
        elif din == 8:
            dout.next = 0b0000000100000000
        elif din == 9:
            dout.next = 0b0000001000000000
        elif din == 10:
            dout.next = 0b0000010000000000
        elif din == 11:
            dout.next = 0b0000100000000000
        elif din == 12:
            dout.next = 0b0001000000000000
        elif din == 13:
            dout.next = 0b0010000000000000
        elif din == 14:
            dout.next = 0b0100000000000000
        else:
            dout.next = 0b1000000000000000

    return decoder_4to16


@block
def testbench():
    din = Signal(intbv(0)[4:])
    dout = Signal(intbv(0)[16:])
    dec = decoder(din, dout)

    @instance
    def stimulus():
        print("input   d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15")
        for i in range(20):
            din.next = randrange(16)
            yield delay(10)
            print(" %s |  %s " % (bin(din, 4), bin(dout,16)))

    return instances()


def convert():
    din = Signal(intbv(0)[4:])
    dout = Signal(intbv(0)[16:])
    dec = decoder(din, dout)
    dec.convert(hdl='Verilog')


convert()
tb = testbench()
tb.run_sim()