<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="RegistrationForm.RegistrationForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="Scripts/scripts/registrationform.js"></script>
    <link href="css/style.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/js/all.min.js" ></script>
    <div class="container">
        <div class="row p-5">
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Registration Form</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-4">
                                <label aria-required="true">First Name</label>
                                <i class="fa fa-star required-field" aria-hidden="true" alt="Required Field"></i>
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox CssClass="form-control" ID="txt_firstName" runat="server" placeholder="First Name" MaxLength="50"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                <asp:RequiredFieldValidator ID="rfv_txt_firstName" CssClass="error-text" runat="server" ControlToValidate="txt_firstName" Display="Dynamic" ErrorMessage="*First Name is required." />
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-4">
                                <label aria-required="true">Last Name</label>
                                <i class="fa fa-star required-field" aria-hidden="true" alt="Required Field"></i>
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox CssClass="form-control" ID="txt_lastName" runat="server" placeholder="Last Name" MaxLength="50"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                <asp:RequiredFieldValidator ID="rfv_txt_lastName" CssClass="error-text" runat="server" ControlToValidate="txt_lastName" Display="Dynamic" ErrorMessage="*Last Name is required." />
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-4">
                                <label aria-required="true">Email</label>
                                <i class="fa fa-star required-field" aria-hidden="true" alt="Required Field"></i>
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox CssClass="form-control" ID="txt_emailID" runat="server" placeholder="Email address" TextMode="Email" onchange="validateEmail()"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                <asp:RequiredFieldValidator ID="rfv_txt_emailID" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="error-text" runat="server" ControlToValidate="txt_emailID" Display="Dynamic" ErrorMessage="*Email is required." />
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-4">
                                <label aria-required="true">Password</label>
                                <i class="fa fa-star required-field" aria-hidden="true" alt="Required Field"></i>
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox CssClass="form-control" ID="txt_password" runat="server" placeholder="Password" TextMode="Password"  MinLength="8"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                <asp:RequiredFieldValidator ID="rfv_txt_password" CssClass="error-text" runat="server" ControlToValidate="txt_password" Display="Dynamic" ErrorMessage="*Password is required." />
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-4">
                                <label aria-required="true">Confirm Password</label>
                                <i class="fa fa-star required-field" aria-hidden="true" alt="Required Field"></i>
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox CssClass="form-control" ID="txt_confirmPassword" runat="server" placeholder="Confirm Password" TextMode="Password"  MinLength="8"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                <asp:RequiredFieldValidator ID="rfv_txt_confirmPassword" CssClass="error-text" runat="server" ControlToValidate="txt_confirmPassword" Display="Dynamic" ErrorMessage="*Confirm Password is required." />
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-4">
                                <label aria-required="true">Date of Birth</label>
                                <i class="fa fa-star required-field" aria-hidden="true" alt="Required Field"></i>
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox CssClass="form-control" ID="txt_dob" runat="server" placeholder="Date-of-birth" TextMode="Date" onchange="validateDOB()"></asp:TextBox >
                            </div>
                            <div class="col-md-4">
                                <asp:RequiredFieldValidator ID="rfv_txt_dob" CssClass="error-text" runat="server" ControlToValidate="txt_dob" Display="Dynamic" ErrorMessage="*DOB is required." />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <asp:Button class="btn btn-info btn-block" ID="Button1" runat="server" Text="Sign Up" OnClick="Button1_Click" disabled/>
                                    <div class="col-md-6">
                                        <span class="text-muted">
                                            <asp:Label ID="lblMessage" runat="server" Text="" CssClass="control-label"></asp:Label></span>
                                    </div>
                                </center>
                            </div>
                        </div>

                        <div class="row mt-2">
                            <div class="col-md-6">
                                <span class="text-muted">Fields marked with (<i class="fa fa-star required-field" aria-hidden="true" aria-label="Required Field"></i>) are required.</span>
                            </div>           
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
