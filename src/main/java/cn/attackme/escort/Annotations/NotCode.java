package cn.attackme.escort.Annotations;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

import static java.lang.annotation.ElementType.*;
import static java.lang.annotation.ElementType.PARAMETER;

/**
 * Created by arthurme on 2017/7/16.
 */
@Documented
@Constraint(validatedBy = NotCodeConstraintValidator.class)
@Target( { METHOD, FIELD, ANNOTATION_TYPE, CONSTRUCTOR, PARAMETER})
@Retention(RetentionPolicy.RUNTIME)
public @interface NotCode {
    String message() default "{NotCode}";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}
