package pkg4;

public aspect TraceAspect {
   pointcut classToTrace(): within(DataApp) || within(ComponentApp) || within(ServiceApp);

   pointcut constructorToTrace(): classToTrace() && execution(new(..));

   pointcut methodToTrace():  classToTrace() &&  execution(String getName(..));


   before(): methodToTrace() {
      System.out.println("[BGN]" + thisJoinPointStaticPart.getSignature() + //
            
            thisJoinPointStaticPart.getSourceLocation().getLine());
   }

   after(): methodToTrace() {
      System.out.println("[END]" + thisJoinPointStaticPart.getSourceLocation());
   }
}






