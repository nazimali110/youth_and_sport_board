using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NokiaCLMessaging;

namespace WindowsFormsApplication1
{
    public struct ParameterSet
    {
        public string ParameterSetName;
        public byte DataCodingScheme;
        public byte ProtocolID;
        public byte ValidityPeriodRelative;
        public string ServiceCenterAddress;
        public string DestinationAddress;
    }

    class smsclass
    {
        private ShortMsgAdapter smsObj;
		private IMemory smsMemObj;

		public smsclass()
		{
			smsObj = new ShortMsgAdapter();
			smsMemObj = (IMemory)smsObj;
		}

		~smsclass()
		{
			smsObj = null;
		}

		// can throw COMException!
		public void SendSMS(string message, string number)
		{
			IGSMParameters parameters;
			IGSMSubmit submitObj;
			ShortMessageItem smsEntry;

			// Get parameter set
			parameters = GetParameterSetOriginal(1);

			// Create new short message
			smsEntry = new ShortMessageItem();
			smsEntry.Type = ShortMessageType.SHORTMESSAGE_TYPE_GSM_SUBMIT;

			submitObj = (IGSMSubmit)smsEntry.TypeProperties;
			submitObj.Message = message;
			submitObj.DestinationAddress = number;
			submitObj.ServiceCenterAddress = parameters.ServiceCenterAddress;
			submitObj.ProtocolID = parameters.ProtocolID;
			submitObj.DataCodingScheme = parameters.DataCodingScheme;
			submitObj.ValidityPeriodRelative = parameters.ValidityPeriodRelative;

			// Send message
			smsObj.SendSMS(ShortMessageRouteType.SHORTMESSAGE_ROUTE_TYPE_ANY, submitObj);
		}

		// can throw COMException!
		public byte GetNumberOfSets()
		{
			byte paramSets;
			smsMemObj.GetParameterSets(out paramSets);
			return paramSets;
		}

		// can throw COMException!
		protected IGSMParameters GetParameterSetOriginal(byte index)
		{
			return (IGSMParameters)smsMemObj.GetParameters(ParametersType.PARAMETERS_TYPE_GSM, index);
		}

		// can throw COMException!
		public ParameterSet GetParameterSet(byte index)
		{
			IGSMParameters parameterEntry =
				(IGSMParameters)smsMemObj.GetParameters(ParametersType.PARAMETERS_TYPE_GSM, index);

			ParameterSet paramSet = new ParameterSet();
			paramSet.ParameterSetName = parameterEntry.ParameterSetName;
			paramSet.ProtocolID = parameterEntry.ProtocolID;
			paramSet.DataCodingScheme = parameterEntry.DataCodingScheme;
			paramSet.ValidityPeriodRelative = parameterEntry.ValidityPeriodRelative;
			paramSet.ServiceCenterAddress = parameterEntry.ServiceCenterAddress;
			paramSet.DestinationAddress = parameterEntry.DestinationAddress;
			return paramSet;
		}

		public string GetDataCodingSchemeText(byte scheme)
		{
			string text = "Unknown";
			switch(scheme)
			{
				case 0: text = "Default alphabet"; break;
				case 8: text = "Unicode"; break;
				case 240: text = "Class 0 7-bit alphabet"; break;
				case 241: text = "Class 1 7-bit alphabet"; break;
				case 242: text = "Class 2 7-bit alphabet"; break;
				case 243: text = "Class 3 7-bit alphabet"; break;
				case 244: text = "Class 0 8-bit alphabet"; break;
				case 245: text = "Class 1 8-bit alphabet"; break;
				case 246: text = "Class 2 8-bit alphabet"; break;
				case 247: text = "Class 3 8-bit alphabet"; break;
			}
			return text;
		}

		public string GetProtocolIDText(byte protocolID)
		{
			string text = "Unknown";
			switch(protocolID)
			{
				case 0: text = "Text"; break;
				case 3: text = "Fax"; break; // Group 3 telefax
				case 38: text = "Pager"; break; // National paging system
				case 50: text = "E-Mail"; break; // Internet electronic mail
			}
			return text;
		}

		private string GetTimeSpanString(TimeSpan span)
		{
			System.Text.StringBuilder text = new System.Text.StringBuilder();
			if (span.Days > 0)
			{
				text.Append(text.Length == 0 ? "" : ", ");
				text.Append(span.Days.ToString());
				text.Append(span.Days == 1 ? " day" : " days");
			}
			if (span.Hours > 0)
			{
				text.Append(text.Length == 0 ? "" : ", ");
				text.Append(span.Hours.ToString());
				text.Append(span.Hours == 1 ? " hour" : " hours");
			}
			if (span.Minutes > 0)
			{
				text.Append(text.Length == 0 ? "" : ", ");
				text.Append(span.Minutes.ToString());
				text.Append(span.Minutes == 1 ? " minute" : " minutes");
			}
			if (span.Seconds > 0)
			{
				text.Append(text.Length == 0 ? "" : ", ");
				text.Append(span.Seconds.ToString());
				text.Append(span.Seconds == 1 ? " second" : " seconds");
			}
			if (span.Milliseconds > 0)
			{
				text.Append(text.Length == 0 ? "" : ", ");
				text.Append(span.Milliseconds.ToString());
				text.Append(span.Milliseconds == 1 ? " millisecond" : " milliseconds");
			}

			if (text.Length == 0)
				return "Nothing";
			else
				return text.ToString();
		}

		public string GetRelativeValidityText(byte value)
		{
			return GetTimeSpanString(GetRelativeValiditySpan(value));
		}

		public TimeSpan GetRelativeValiditySpan(byte value)
		{
			if (value >=0 && value <= 143)
				return new TimeSpan(0, (value+1)*5, 0); // (value+1)*5 minutes
			if (value >= 144 && value <= 167)
				return new TimeSpan(12, (value-143)*30, 0); // (value-143)*30 minutes + 12 hours
			if (value >= 168 && value <= 196)
				return new TimeSpan(value-166, 0, 0, 0); // (value-166)*1 day
			if (value >= 197 && value <= 255)
				return new TimeSpan((value-192)*7, 0, 0, 0); // (value-192)*1 week

			return new TimeSpan(0, 0, 0); // should never occur
		}
    }
}
