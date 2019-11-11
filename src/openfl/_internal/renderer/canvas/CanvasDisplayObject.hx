package openfl._internal.renderer.canvas;

import openfl._internal.backend.math.ARGB;
import openfl.display.DisplayObject;

@:access(openfl.display.DisplayObject)
@:access(openfl.geom.Matrix)
@SuppressWarnings("checkstyle:FieldDocComment")
class CanvasDisplayObject
{
	public static inline function render(displayObject:DisplayObject, renderer:CanvasRenderer):Void
	{
		#if openfl_html5
		if (displayObject.opaqueBackground == null && displayObject.__graphics == null) return;
		if (!displayObject.__renderable) return;

		var alpha = renderer.__getAlpha(displayObject.__worldAlpha);
		if (alpha <= 0) return;

		if (displayObject.opaqueBackground != null
			&& !displayObject.__isCacheBitmapRender
			&& displayObject.width > 0
			&& displayObject.height > 0)
		{
			renderer.__setBlendMode(displayObject.__worldBlendMode);
			renderer.__pushMaskObject(displayObject);

			var context = renderer.context;

			renderer.setTransform(displayObject.__renderTransform, context);

			var color:ARGB = (displayObject.opaqueBackground : ARGB);
			context.fillStyle = 'rgb(${color.r},${color.g},${color.b})';
			context.fillRect(0, 0, displayObject.width, displayObject.height);

			renderer.__popMaskObject(displayObject);
		}

		if (displayObject.__graphics != null)
		{
			CanvasShape.render(displayObject, renderer);
		}
		#end
	}
}
