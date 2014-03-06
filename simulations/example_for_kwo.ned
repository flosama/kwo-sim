
import ned.DatarateChannel;
import inet.networklayer.autorouting.ipv4.IPv4NetworkConfigurator;
import inet.nodes.inet.Router;
import inet.nodes.inet.StandardHost;


@license(LGPL);

network UnicastNetwork
{
    types:
        channel ethernet extends DatarateChannel
        {
            delay = normal(0.00015s, 0.00005s);
            datarate = 1000Mbps;
        }
        channel fiberrouter extends DatarateChannel
        {
            delay = normal(0.000001s, 0.0000001s);
            datarate = 10000Mbps;
            @display("ls=red");
        }
    submodules:
        host1: StandardHost {
            parameters:
                IPForward = false;
                @display("p=119,60;i=device/pc2");
            gates:
                pppg[1];
        }
        host2: StandardHost {
            parameters:
                IPForward = false;
                @display("p=119,200;i=device/pc2");
            gates:
                pppg[1];
        }
        host3: StandardHost {
            parameters:
                IPForward = false;
                @display("p=463,130");
            gates:
                pppg[1];
        }
        router1: Router {
            parameters:
                @display("p=241,60");
            gates:
                pppg[4];
        }
        router2: Router {
            parameters:
                @display("p=241,200");
            gates:
                pppg[4];
        }
        router3: Router {
            parameters:
                @display("p=341,130");
            gates:
                pppg[4];
        }
        configurator: IPv4NetworkConfigurator {
            @display("p=461,37");
        }
    connections:
        // Domain 1
        host1.pppg[0] <--> ethernet <--> router1.pppg[1];

        // Domain 2
        host2.pppg[0] <--> ethernet <--> router2.pppg[1];
        
        // Domain 3
        host3.pppg[0] <--> ethernet <--> router3.pppg[1];

        // Router Connections
         router1.pppg[0] <--> fiberrouter <--> router2.pppg[0];
         router1.pppg[1] <--> fiberrouter <--> router3.pppg[0];
         router2.pppg[1] <--> fiberrouter <--> router3.pppg[1];
        
}
