import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flector/core/presentation/theme/app_theme.dart';
import 'package:flector/features/settings/domain/entities/currency.dart';
import 'package:flector/features/settings/presentation/cubit/currency_cubit.dart';
import 'package:flector/features/settings/presentation/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showSettingsDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (_) {
        return const Dialog(
          child: SettingsView(),
        );
      });
}

class SettingsView extends StatelessWidget {
  const SettingsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.settings),
          trailing: IconButton(
            icon: Icon(
              Icons.close,
              color: _theme.colorScheme.secondary,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Settings',
            style: _theme.textTheme.headline6,
          ),
        ),
        const SectionName('Appearance'),
        const ThemeSwitch(),
        const SectionName('Currency'),
        const CurrencyRadioList()
      ],
    );
  }
}

class CurrencyRadioList extends StatelessWidget {
  const CurrencyRadioList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyCubit, Currency>(
      builder: (context, state) {
        return Column(
          children: [
            RadioListTile<Currency>(
              title: Text(Currency.usd.isoCode),
              value: Currency.usd,
              groupValue: state,
              onChanged: (Currency? value) {
                if (value != null) {
                  context.read<CurrencyCubit>().setCurrency(value);
                }
              },
            ),
            RadioListTile<Currency>(
              title: Text(Currency.eur.isoCode),
              value: Currency.eur,
              groupValue: state,
              onChanged: (Currency? value) {
                if (value != null) {
                  context.read<CurrencyCubit>().setCurrency(value);
                }
              },
            ),
            RadioListTile<Currency>(
              title: Text(Currency.gbp.isoCode),
              value: Currency.gbp,
              groupValue: state,
              onChanged: (Currency? value) {
                if (value != null) {
                  context.read<CurrencyCubit>().setCurrency(value);
                }
              },
            ),
          ],
        );
      },
    );
  }
}

class SectionName extends StatelessWidget {
  final String title;
  const SectionName(
    this.title, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) {
        return SwitchListTile(
          value: state == ThemeMode.dark,
          onChanged: (value) {
            context
                .read<ThemeCubit>()
                .setTheme(value ? ThemeMode.dark : ThemeMode.light);
          },
          title: const Text('Dark Mode'),
          secondary: Icon(
            Icons.dark_mode,
            color: state == ThemeMode.dark
                ? Theme.of(context).colorScheme.secondary
                : null,
          ),
        );
      },
    );
  }
}
