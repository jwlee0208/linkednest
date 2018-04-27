package net.linkednest.runtime.interceptor;

import java.util.Arrays;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class RequestInterceptor {
	
	final Log logger = LogFactory.getLog(this.getClass());
	
    /**
     * 모든 controller호출에 대한 return log 위한 pointcut 선언
     */
    @Pointcut("execution(* com..*Controller*.*(..))")
    public void call4ControllerLog() {
    }

    /**
     * @brief 모든 controller의 호출에 대한 return log
     * @details
     * @param joinPoint
     * @return
     */
    @AfterReturning("call4ControllerLog()")
    public void _afterLog(JoinPoint joinPoint) throws Exception {       
        if (logger.isDebugEnabled()) {
            
            Signature signature = joinPoint.getSignature(); 
            String className = joinPoint.getTarget().getClass().getName();
            String methodName = signature.getName();
            String stuff = signature.toString();
            String arguments = Arrays.toString(joinPoint.getArgs());
            
            logger.debug("################################################");
            logger.debug("call class:"
                    + className
                    + ", call method: "
                    + methodName
                    + ", arguments: "
                    + arguments
                    + "\nand the full toString: " + stuff);
        }
    }	
}
