/*
   Code by http://blog.another-d-mention.ro/programming/how-to-clone-duplicate-an-object-in-actionscript-3/comment-page-1/#comment-848
*/
package
{
	import flash.utils.describeType;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;

	public class UtilFunctions
	{


		private static function newSibling(sourceObj:Object):* {
			if(sourceObj) {

				var objSibling:*;
				try {
					var classOfSourceObj:Class = 
						getDefinitionByName(getQualifiedClassName(sourceObj)) as Class;
					objSibling = new classOfSourceObj();
				}

				catch(e:Object) {}

				return objSibling;
			}
			return null;
		}

		public static function clone(source:Object):Object {

			var clone:Object;
			if(source) {
				clone = newSibling(source);

				if(clone) {
					copyData(source, clone);
				}
			}

			return clone;
		}

		private static function copyData(source:Object, destination:Object):void {

			//copies data from commonly named properties and getter/setter pairs
			if((source) && (destination)) {

				try {
					var sourceInfo:XML = describeType(source);
					var prop:XML;

					for each(prop in sourceInfo.variable) {

						if(destination.hasOwnProperty(prop.@name)) {
							destination[prop.@name] = source[prop.@name];
						}

					}

					for each(prop in sourceInfo.accessor) {
						if(prop.@access == "readwrite") {
							if(destination.hasOwnProperty(prop.@name)) {
								destination[prop.@name] = source[prop.@name];
							}

						}
					}
				}
				catch (err:Object) {
					;
				}
			}
		}
	}
}
