class Solution{
    fun sequentialDigits(l:Int,h:Int)=buildList{
        for(i in 1..9){
            var x=i
            for(j in i+1..9){
                x=x*10+j
                if(x>h)break
                if(x>=l)add(x)
            }
        }
    }.sorted()
}