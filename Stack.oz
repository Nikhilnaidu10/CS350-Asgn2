declare PopStack PushStack TopStack in

    fun {PushStack S Elem}
       Elem | S
    end

    fun {PopStack S}
       case S
       of nil then {Error "Semantic stack is empty..."}
       [] _|T then T
       end
    end

    fun {TopStack S}
       case S
       of nil then nil
       [] H|_ then H
       end
    end



