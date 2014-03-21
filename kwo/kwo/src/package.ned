package kwo;

import inet.nodes.ospfv2.OSPFRouter;
import inet.util.ThruputMeteringChannel;


@license(LGPL);

channel LWL_1GBit extends ThruputMeteringChannel
{
    delay = 0.1us;
    datarate = 1Gbps;
    thruputDisplayFormat = "#N";
    @display("ls=red");
}

channel CU_1GBit extends ThruputMeteringChannel
{
    delay = 1us;
    datarate = 1Gbps;
    thruputDisplayFormat = "#N";
    @display("ls=blue");
}

channel UHF_50MBit extends ThruputMeteringChannel
{
    delay = 1ms;
    datarate = 50 Mbps;
    thruputDisplayFormat = "#N";
    @display("ls=yellow");
}

network leittechnicknetz_kwo
{
    submodules:
        // Distribution Networks
        distr_gri2: distribution_grimsel_2 {
            @display("p=50,50");
        }
        distr_han: distribution_handeck {
            @display("p=300,50");
        }
        // Core-Switches
        Core_Gri: OSPFRouter {
            parameters:
                @display("p=100,150");
            gates:
                ethg[8];
        }
        Core_Han: OSPFRouter {
            parameters:
                @display("p=250,150");
            gates:
                ethg[8];
        }
        Core_UST: OSPFRouter {
            parameters:
                @display("p=100,250");
            gates:
                ethg[8];
        }
        Core_BG: OSPFRouter {
            parameters:
                @display("p=250,250");
            gates:
                ethg[8];
        }

    connections:

        // Core mesh connections
        Core_Gri.ethg++ <--> LWL_1GBit <--> Core_UST.ethg++;
        Core_Gri.ethg++ <--> LWL_1GBit <--> Core_Han.ethg++;
        Core_Gri.ethg++ <--> UHF_50MBit <--> Core_BG.ethg++;
        Core_Han.ethg++ <--> LWL_1GBit <--> Core_BG.ethg++;
        Core_Han.ethg++ <--> LWL_1GBit <--> Core_UST.ethg++;
        Core_UST.ethg++ <--> LWL_1GBit <--> Core_BG.ethg++;

        // Connections to other network parts
        Core_Gri.ethg++ <--> LWL_1GBit <--> distr_gri2.gri2b;
        Core_Han.ethg++ <--> LWL_1GBit <--> distr_gri2.gri2a;
        Core_Gri.ethg++ <--> LWL_1GBit <--> distr_han.disthanB;
        Core_Han.ethg++ <--> LWL_1GBit <--> distr_han.disthanA;
}

module distribution_grimsel_2
{
    gates:
        inout gri2a;
        inout gri2b;

    submodules:
        gri2_A: OSPFRouter {
            parameters:
                @display("p=100,100");
            gates:
                ethg[8];
        }

        gri2_B: OSPFRouter {
            parameters:
                @display("p=250,100");
            gates:
                ethg[8];
        }

    connections:
        gri2_A.ethg++ <--> LWL_1GBit <--> gri2_B.ethg++;
        gri2_A.ethg++ <--> LWL_1GBit <--> gri2a;
        gri2_B.ethg++ <--> LWL_1GBit <--> gri2b;
}


module distribution_handeck
{
    gates:
        inout disthanA;
        inout disthanB;

    submodules:
        Dist_Han_A: OSPFRouter {
            parameters:
                @display("p=100,100");
            gates:
                ethg[8];
        }

        Dist_Han_B: OSPFRouter {
            parameters:
                @display("p=250,100");
            gates:
                ethg[8];
        }

    connections:
        Dist_Han_A.ethg++ <--> LWL_1GBit <--> Dist_Han_B.ethg++;
        Dist_Han_A.ethg++ <--> LWL_1GBit <--> disthanA;
        Dist_Han_B.ethg++ <--> LWL_1GBit <--> disthanB;
}

module distribution_handeck_2
{
}

module distribution_handeck_3
{
}

module distribution_innertkirchen
{
}

module access_innertkirchen
{
}

module access_innertkirchen_2
{
}

module access_innertkirchen_sa150
{
}

module access_vis
{
}

module access_gadmental
{
}

module access_grimsel_sa220
{
}

module access_grimsel
{
}

module access_grimsel_2
{
}

module access_handeck_2
{
}

network access_ust_sa16
{
}


