table 70002 "Attribute Lines"
{
    DataClassification = ToBeClassified;
    Caption = 'Lines';

    fields
    {
        field(1;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Attribute No.';
        }
        field(2;"Line No.";Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Line No.';
        }
        field(3;"Test Instrument";code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Test Device';
        }
        field(4;Description;Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';
        }
    }
    keys
    {
        key(PK;"Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
    var myInt: Integer;
    trigger OnInsert()begin
    end;
    trigger OnModify()begin
    end;
    trigger OnDelete()begin
    end;
    trigger OnRename()begin
    end;
}
