table 70001 "Attribute Header"
{
    DataClassification = ToBeClassified;
    Caption = 'Attribute Header';

    fields
    {
        field(1;"No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No';

            trigger OnValidate();
            begin
                teststatus();
                if "No." <> xRec."No." then begin
                    QCSetup.Get();
                    NoSeriesMgt.TestManual(QCSetup."Test Attributes");
                    NoSeries:='';
                end;
            end;
        }
        field(2;Description;Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';

            trigger OnValidate()begin
                teststatus();
                if "Search Description" = '' then "Search Description":=Description;
            end;
        }
        field(3;"Attribute Type";Option)
        {
            OptionMembers = " ", "Qualitative", "Quantitative";
            OptionCaption = ' ,Qualitative,Quantitative';
            Caption = 'Attribute Type';
            DataClassification = ToBeClassified;

            trigger OnValidate()begin
                teststatus();
            end;
        }
        field(4;Status;Option)
        {
            OptionMembers = "New", "Certified", "UnderDevelopment", "Closed";
            OptionCaption = 'New,Certified,Under Development,Closed';
            Caption = 'Status';
            DataClassification = ToBeClassified;

            trigger OnValidate()begin
            end;
        }
        field(5;"Search Description";Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Search Description';

            trigger OnValidate()begin
            end;
        }
        field(6;"Test Methodology";Code[50])
        {
        }
        field(7;"Certified Date";Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Certified Date';

            trigger OnValidate()begin
            end;
        }
        field(8;"Certified By";Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Certified  By';

            trigger OnValidate()begin
            end;
        }
        field(9;NoSeries;Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No Series';

            trigger OnValidate()begin
            end;
        }
    }
    keys
    {
        key(PK;"No.")
        {
            Clustered = true;
        }
    }
    var QCSetup: Record "Quality Control Setup";
    NoSeriesMgt: Codeunit NoSeriesManagement;
    trigger OnInsert()begin
        if "No." = '' then begin
            QCSetup.Get();
            QCSetup.TestField("Test Attributes");
            NoSeriesMgt.InitSeries(QCSetup."Test Attributes", xRec.NoSeries, 0D, "No.", NoSeries);
        end;
    end;
    trigger OnModify()begin
    end;
    trigger OnDelete()begin
    end;
    trigger OnRename()begin
    end;
    local procedure teststatus()begin
        if Status = Status::Certified then FieldError(Status);
    end;
}
