$("#detailBtn3").on("click",function(){
	$.ajax({
		url:"wordcloud",
		type:"get",
		data:{"appid":appid},
		success:function(rs){
		
		// Create root element
		// https://www.amcharts.com/docs/v5/getting-started/#Root_element
		var coffee = am5.Root.new("bang");
		
		// Set themes
		// https://www.amcharts.com/docs/v5/concepts/themes/
		coffee.setThemes([
		  am5themes_Animated.new(coffee)
		]);
		
		
		// Add series
		// https://www.amcharts.com/docs/v5/charts/word-cloud/
		var series = coffee.container.children.push(am5wc.WordCloud.new(coffee, {
		  categoryField: "modeword",
		  valueField: "modecount",
		  maxFontSize: am5.percent(30),
		  minFontSize: am5.percent(8),
		  colors: am5.ColorSet.new(coffee, {
		      colors: [
		        am5.color(0x095256),
		        am5.color(0x087f8c),
		        am5.color(0x5aaa95),
		        am5.color(0x86a873),
		        am5.color(0xbb9f06),
		        am5.color(0x22d558),
		        am5.color(0x22d558),
		        am5.color(0xE66C8C),
		        am5.color(0xE117E8),
		        am5.color(0xA5EB68),
		        am5.color(0xD57622),
		        am5.color(0x2264D5),
		
		      ]
		    }),
		}));
		
		// Configure labels
		series.labels.template.setAll({
		  fontFamily: "Gothic",
			  paddingTop: 50,
			  paddingBottom: 10,
			  paddingLeft: 10,
			  paddingRight: 10
		});
		series.labels.template.tooltipText = "{word}: {value}";
		
		// Data from:
		// https://insights.stackoverflow.com/survey/2021#section-most-popular-technologies-programming-scripting-and-markup-languages
		
		
		series.data.setAll(
				rs
				);
	},
	error:function(){
		console.log("error");
	}
})
})