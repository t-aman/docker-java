import java.util.*;

class Main {
    public static void main(String[] args) {
        // system
        Properties props = System.getProperties();
        props.list(System.out);

    	// args
        for(int i=0; i<args.length; i++){
            System.out.println(args[i]);
         }
    }
}
