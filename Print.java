public class Print {
   public static void main(String[] args){
       System.out.println("cpu:" + Runtime.getRuntime().availableProcessors());
       System.out.println("memory:" + Runtime.getRuntime().maxMemory()/1024/1024);
   }
}
