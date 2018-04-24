从0-9 A-Z 中随机选取4位生成随机唯一码

分析：
1、0-9 A-Z 共 36位 ，从36位中获取四位，总计的排列组合为：36的4次方种可能
2、0-9 A-Z 共 36位，可以将所有字符组合到一起看成一种36进制的数字
3、10进制：36x36x36x36 = 1679616,将这些数字转成36进制的数字 = 0 - ZZZZ
4、将每一个数字转成四位数则是一个随机唯一码，例如 0 = 0000 ，1 = 0001
5、算法核心：从 0 - 1679616 中随机取一个不重复数字，转成4位的36进制数字，则是我们要的随机唯一码

备注：如果4位不够，可以增加到5位，6位，则生成的比例会以36倍数增长

伪代码：
function createCode（）{
	var max = 36 * 36 * 36 * 36 = 1679616 //定义最大数字
	var r = Random(max) //从0到最大数字随机取一个数字
	var result = 10To36(r);//获取四位36进制数字组合

}

//计算10进制数字转为36进制
function 10To36(var r){
	array[] result = {0,0,0,0,};//定义一个四位数数组
	var point = 3;
	while(r != 0){//如果所取的十进制数字不为0，则继续循环
		var temp = r % 36 //让数字对36取余，获取当前位数的36进制数字
		r = r / 36; 
		result.insert(point,result);//从低位开始添加
		point = point - 1; //指针左移
	}

	return result;
}

//将10进制数字转成36进制单位
function var change(var temp){
	if(temp < 10){
		return temp;
	}else{
		return  (char)(temp - 10 + 'A'); //
	}

}

java 代码：
public class Test {

	public static void main(String[] args) {
		int max = 36 * 36 * 36 * 36; //定义最大数字
		int r = new Random().nextInt(max); //从0到最大数字随机取一个数字
		List<String> list = tenTo36(r);//获取四位36进制数字组合
		System.out.println(list);
	}
	
	public static List<String> tenTo36(int r){
//		List<String> result = new ArrayList<String>();
		String[] result = {"0","0","0","0"};
		int point = 3;
		while(r != 0){//如果所取的十进制数字不为0，则继续循环
			int temp = r % 36; //让数字对36取余，获取当前位数的36进制数字
			r = r / 36;
			String s = change(temp)+"";
			result[point] = s;
//			result.add(point,change(temp)+"");//从低位开始添加
			point = point - 1; //指针左移
		}
		
		return Arrays.asList(result);
	}
	
	public static char change(int temp){
		if(temp < 10){
			return (char)(temp + '0');
		}else{
			return  (char)(temp - 10 + 'A'); 
		}
	}
}