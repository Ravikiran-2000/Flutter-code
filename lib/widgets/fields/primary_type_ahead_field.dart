import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:time_table/constants/app_colors.dart';
import 'package:time_table/widgets/texts/primary_text.dart';

class PrimaryTypeAheadField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isRequired;
  final SuggestionsCallback<Object?> suggestionsCallback;
  final SuggestionSelectionCallback<Object?> onSuggestionSelected;
  final ItemBuilder<Object?> itemBuilder;
  final RxBool isValid;
  final String errorMsg;
  final RegExp? allowedRegex;
  final bool isSuffixNeeded;
  final TextInputAction textInputAction;
  final VoidCallback? onTap;

  const PrimaryTypeAheadField({
    Key? key,
    required this.controller,
    required this.label,
    this.isRequired = false,
    required this.suggestionsCallback,
    required this.onSuggestionSelected,
    required this.itemBuilder,
    required this.isValid,
    required this.errorMsg,
    this.allowedRegex,
    this.isSuffixNeeded = true,
    this.textInputAction = TextInputAction.done,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TypeAheadField(
            suggestionsBoxDecoration: SuggestionsBoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            textFieldConfiguration: TextFieldConfiguration(
              enableInteractiveSelection: false,
              textInputAction: textInputAction,
              controller: controller,
              autofocus: false,
              textCapitalization: TextCapitalization.words,
              inputFormatters: allowedRegex != null
                  ? [
                      FilteringTextInputFormatter.allow(
                          allowedRegex ?? RegExp('')),
                    ]
                  : [],
              style: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                  left: 10,
                  bottom: 10,
                  top: 10,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: isValid.value
                        ? AppColors.grey300Color
                        : AppColors.errorColor,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                ),
                label: RichText(
                  text: TextSpan(
                    text: label,
                    style: const TextStyle(
                      fontSize: 15,
                      color: AppColors.grey600Color,
                    ),
                    children: [
                      TextSpan(
                        text: isRequired ? ' *' : "",
                        style: const TextStyle(
                          color: AppColors.errorColor,
                        ),
                      ),
                    ],
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          isValid.value ? Colors.blue : AppColors.errorColor),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                ),
                fillColor: AppColors.grey300Color,
                filled: true,
              ),
              onChanged: (e) {
                if (e.isEmpty && isRequired) {
                  isValid.value = false;
                } else {
                  isValid.value = true;
                }
              },
              onTap: onTap,
            ),
            suggestionsCallback: suggestionsCallback,
            itemBuilder: itemBuilder,
            onSuggestionSelected: onSuggestionSelected,
          ),
          PrimaryText(
            isValid.value ? "" : errorMsg,
            fontWeight: FontWeight.w400,
            fontSize: 12,
            fontColor: AppColors.errorColor,
            horizontalPadding: 10,
            verticalPadding: 0,
          ),
          const SizedBox(
            height: 3,
          ),
        ],
      );
    });
  }
}
