package 
{
	import flash.display.Shader;
	import flash.filters.ShaderFilter;
	import flash.utils.ByteArray;
	
	/**
	 * PageCurlFilter
	 * @author Thomas Vian
	 */
	public class PageCurlFilter extends ShaderFilter
	{
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		
		[Embed("/singlesidecurl.pbj", mimeType="application/octet-stream")]
		public var CurlData:Class;	
		
		private var _curlShader:Shader;
		
		private var _normal:Array;
		private var _curlOffset:Array;
		
		private const _halfPi:Number = Math.PI * 0.5;
		
		//--------------------------------------------------------------------------
		//
		//  Getters / Setters
		//
		//--------------------------------------------------------------------------
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function PageCurlFilter()
		{
			_curlShader = new Shader(new CurlData() as ByteArray);
			super(_curlShader);
			
			_normal = [];
			_curlOffset = [];
		}
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		
		public function setPageCurl(curl:Number = 0.0, angle:Number = 0):void
		{
			if (curl < 0) curl = 0;
			if (angle < 0) angle = 0;
			else if (angle > _halfPi) angle = _halfPi;
			
			_normal[0] = Math.cos(angle);
			_normal[1] = Math.sin(angle);
			
			_curlOffset[0] = curl;
			
			_curlShader.data.normal.value = _normal;
			_curlShader.data.curlOffset.value = _curlOffset;
		}
	}
}