CONTAINER Odescription
{
	NAME Odescription;
	INCLUDE Obase;

	GROUP ID_OBJECTPROPERTIES
	{


		GROUP ID_GROUP_CONTROL
		{
			LAYOUTGROUP; COLUMNS 3; DEFAULT 1;

			GROUP
			{
				LONG ID_SELECT_DESCRIPTION		{ SCALE_H; CYCLE { }; }
			}

			GROUP
			{
				BUTTON ID_SET_PARAMETER {}
			}

			GROUP
			{
				BUTTON ID_GET_PARAMETER {}
			}
			

		}

		GROUP ID_GROUP_DYAMIC
		{
			DEFAULT 1; SCALE_H;
		}

		GROUP ID_GROUP_RESULT
		{
			DEFAULT 1; SCALE_H;

			STRING ID_RESULT_TEXT  { CUSTOMGUI MULTISTRING; ANIM OFF; }
		}
	}

	
}

